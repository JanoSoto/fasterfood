class VentaController < ApplicationController
  check_authorization
  before_filter :authenticate_user!#, :except => [:index, :show]
  load_and_authorize_resource param_method: :compuesto_params
  before_action :set_venta, only: [:show, :edit, :update, :destroy, :cambiar_estado]

  # GET /venta
  # GET /venta.json
  def index
    @venta = Venta.order(fecha_hora: :desc).where('date(fecha_hora) = ?', Time.now.strftime("%Y-%m-%d"))
  end

  def historial
    @venta = Venta.order(fecha_hora: :desc).where('date(fecha_hora) = ?', Time.now.strftime("%Y-%m-%d"))
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
  end

  # GET /venta/new
  def new
    @venta = Venta.new
    @venta.numero_de_caja = 1
    @venta.estado_venta = Venta.estados['PREPARANDO']
    
    basicos = Basico.where(en_venta: true)
    compuestos = Compuesto.where(en_venta: true)

    basicos.each do | basico |
      basico.tipo = 'basico'
    end

    compuestos.each do | compuesto |
      compuesto.tipo = 'compuesto'
    end

    @diferencia_basicos = basicos + compuestos
  end

  # GET /venta/1/edit
  def edit
  end

  # POST /venta
  # POST /venta.json
  def create
    @venta = Venta.new(venta_params)
    
    respond_to do |format|
        @venta.vendedor_id = current_user.id
        @venta.fecha_hora = Time.now
        @venta.numero_de_caja = 1
        @venta.estado_venta = Venta::PREPARANDO

        ##### Agregar Basicos #####
        basicos = Array.new
        if !params[:venta][:basico].nil?
            params[:venta][:basico].each do | basico |

            #id = basico['id'].slice('basico_').to_s.slice('compuesto_').to_s
            #basico['id']['basico_'] = ''
            id = basico['id'].sub('basico_', '')
            id =        id.sub('compuesto_', '')
            tipo = basico['id'].sub('_'+id, '')
            basicos.push(:id => id, :cantidad => basico['cantidad'], :comentario => basico['comentario'], :tipo => tipo)
            #basicos.push(:id => basico['id'], :comentario => basico['comentario'])
        end
    end

    i = 0
    @venta.basico = Array.new
    @venta.compuesto = Array.new
    @venta.detalle = Array.new

    @venta.precio_total = 0;
    
    productos_validos = true

    basicos.each do | basico |
        if basico[:tipo] == 'basico'
            if Basico.exists?(:id => basico[:id])
                basico_nuevo = Basico.find(basico[:id])
                @venta.basico.push basico_nuevo
            else
                productos_validos = false
                @venta.errors.add :general, "Ingreso un producto inválido, ingréselos nuevamente porfavor."
                break
            end
        elsif basico[:tipo] == 'compuesto'
            if Compuesto.exists?(:id => basico[:id])
                basico_nuevo = Compuesto.find(basico[:id])
                @venta.compuesto.push basico_nuevo
            else
                productos_validos = false
                @venta.errors.add :general, "Ingreso un producto inválido, ingréselos nuevamente porfavor."
                break
            end
        else
            productos_validos = false
            @venta.errors.add :general, "Ingreso un producto inválido, ingréselos nuevamente porfavor."
            break
        end

        if productos_validos
            @venta.detalle[i].cantidad = basico[:cantidad]
            @venta.detalle[i].comentario = basico[:comentario]
            @venta.detalle[i].precio = basico_nuevo.precio.to_i * basico[:cantidad].to_i
            @venta.detalle[i].estado = Venta::PREPARANDO

            @venta.precio_total += basico_nuevo.precio.to_i * basico[:cantidad].to_i
        end
        i = i + 1
    end
    
    basicos = Basico.where(en_venta: true)
    compuestos = Compuesto.where(en_venta: true)

    basicos.each do | basico |
        basico.tipo = 'basico'
    end

    compuestos.each do | compuesto |
        compuesto.tipo = 'compuesto'
    end

    if productos_validos
        

        @diferencia_basicos = (basicos - @venta.basico ) + (compuestos  - @venta.compuesto)
        #@diferencia_basicos = @venta.basico

        tiene_productos = @venta.basico.any? and @venta.compuesto.any?
        if !tiene_productos
            @venta.errors.add :general, "Debe agregar a lo menos un producto."
        end
    else
        @venta.basico = Array.new
        @venta.compuesto = Array.new

        @diferencia_basicos = basicos + compuestos
    end
    if productos_validos and tiene_productos and @venta.save
        #format.html { redirect_to @venta, notice: 'Venta añadida correctamente.' }
        format.html { redirect_to '/venta', notice: 'Venta añadida correctamente.' }
        format.json { render :show, status: :created, location: @venta }
    else
        format.html { render :new }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
    end
end
end

  # PATCH/PUT /venta/1
  # PATCH/PUT /venta/1.json
  #def update
    #respond_to do |format|
      #if @venta.estado_venta.nil?
        #@venta.errors.add :base, "La venta no se puede actualizar"
        #format.html { render :edit }
        #format.json { render json: @venta.errors, status: :unprocessable_entity }
        #exit
      #end
      ###### Agregar Basicos #####
      #basicos = Array.new
      #if !params[:venta][:basico].nil?
          #params[:venta][:basico].each do | basico |
#            
              #@venta.errors.add :nombre_cliente, "HOLA"
              #basicos.push(:id => basico['id'], :cantidad => basico['cantidad'])
          #end
      #end
#
      #i = 0
      #@venta.basico = Array.new
      #@venta.detalle = Array.new
#
      #@venta.precio_total = 0;
#      
      #basicos.each do | basico |
        #basico_nuevo = Basico.find(basico[:id])
        #@venta.errors.add :comentario_perdida, basico_nuevo.inspect
        #@venta.basico.push basico_nuevo
        #@venta.detalle[i].cantidad = basico[:cantidad]
        #@venta.precio_total += basico_nuevo.precio.to_i * basico[:cantidad].to_i
        #i = i + 1
      #end
      ###### Agregar Basicos #####
      #if @venta.update(venta_params)
        #format.html { redirect_to @venta, notice: 'Venta was successfully updated.' }
        #format.json { render :show, status: :ok, location: @venta }
      #else
        #format.html { render :edit }
        #format.json { render json: @venta.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    #@venta.destroy
    mensaje = "Ha ocurrido un error al cancelar la venta."
    if @venta.estado_venta != Venta::ENTREGADA
        mensaje = "Venta cancelada correctamente."
        @venta.estado_venta = Venta::CANCELADA
        @venta.save
    end
    respond_to do |format|
      #format.html { redirect_to venta_url, notice: 'Venta was successfully destroyed.' }
      format.html { redirect_to '/venta', notice: mensaje }
      format.json { head :no_content }
    end
  end

  def preparar
  end

  def cambiar_estado
    #@venta.destroy
    #
    #@venta.estado_venta = nil
    #@venta.save
    #id = params[:id]
    #@venta = 
    estado_actual = @venta.estado_venta.to_i
    estado_nuevo = params[:estado_nuevo].to_i
    mensaje = "No se pudo cambiar el estado de la venta." + estado_actual.to_s
    if estado_nuevo.in?(Venta.estados.values) and estado_actual < estado_nuevo
      @venta.estado_venta = estado_nuevo
      @venta.save
      mensaje = "Estado cambiado correctamente."
      if estado_nuevo == Venta.estados['ENTREGADA']
        mensaje = "Venta entregada correctamente."
      end
    end

    respond_to do |format|
      #format.html { redirect_to '/venta', notice: mensaje}
      format.html { redirect_to '/venta'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venta_params
      params.require(:venta).permit(:fecha_hora, :nombre_cliente, :precio_total, :comentario_perdida, :numero_de_caja, :estado_venta, :tiempo_terminado_venta)
    end
end
