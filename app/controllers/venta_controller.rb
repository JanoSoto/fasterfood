class VentaController < ApplicationController
  before_action :set_venta, only: [:show, :edit, :update, :destroy, :cambiar_estado]

  # GET /venta
  # GET /venta.json
  def index
    @venta = Venta.all
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
  end

  # GET /venta/new
  def new
    @venta = Venta.new
    @venta.numero_de_caja = 1
    @venta.estado_venta = Venta.estados['EMITIDA']
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
      @venta.estado_venta = 1

      ##### Agregar Basicos #####
      basicos = Array.new
      if !params[:venta][:basico].nil?
          params[:venta][:basico].each do | basico |
            
              @venta.errors.add :nombre_cliente, "HOLA"
              basicos.push(:id => basico['id'], :cantidad => basico['cantidad'])
          end
      end

      i = 0
      @venta.basico = Array.new
      @venta.detalle = Array.new

      @venta.precio_total = 0;
      
      basicos.each do | basico |
        basico_nuevo = Basico.find(basico[:id])
        @venta.errors.add :comentario_perdida, basico_nuevo.inspect
        @venta.basico.push basico_nuevo
        @venta.detalle[i].cantidad = basico[:cantidad]
        @venta.precio_total += basico_nuevo.precio.to_i * basico[:cantidad].to_i
        i = i + 1
      end
      ##### Agregar Basicos #####
      
      if @venta.save
        format.html { redirect_to @venta, notice: 'Venta añadida correctamente.' }
        format.json { render :show, status: :created, location: @venta }
      else
        format.html { render :new }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venta/1
  # PATCH/PUT /venta/1.json
  def update
    respond_to do |format|
      if @venta.estado_venta.nil?
        @venta.errors.add :base, "La venta no se puede actualizar"
        format.html { render :edit }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
        exit
      end
      ##### Agregar Basicos #####
      basicos = Array.new
      if !params[:venta][:basico].nil?
          params[:venta][:basico].each do | basico |
            
              @venta.errors.add :nombre_cliente, "HOLA"
              basicos.push(:id => basico['id'], :cantidad => basico['cantidad'])
          end
      end

      i = 0
      @venta.basico = Array.new
      @venta.detalle = Array.new

      @venta.precio_total = 0;
      
      basicos.each do | basico |
        basico_nuevo = Basico.find(basico[:id])
        @venta.errors.add :comentario_perdida, basico_nuevo.inspect
        @venta.basico.push basico_nuevo
        @venta.detalle[i].cantidad = basico[:cantidad]
        @venta.precio_total += basico_nuevo.precio.to_i * basico[:cantidad].to_i
        i = i + 1
      end
      ##### Agregar Basicos #####
      if @venta.update(venta_params)
        format.html { redirect_to @venta, notice: 'Venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @venta }
      else
        format.html { render :edit }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    #@venta.destroy
    @venta.estado_venta = Venta::CANCELADA
    @venta.save
    respond_to do |format|
      #format.html { redirect_to venta_url, notice: 'Venta was successfully destroyed.' }
      format.html { redirect_to '/venta', notice: 'Venta cancelada correctamente.'}
      format.json { head :no_content }
    end
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
      #format.html { redirect_to venta_url, notice: 'Venta was successfully destroyed.' }
      #format.html { redirect_to '/venta', notice: 'Venta entregada correctamente.'}
      format.html { redirect_to '/venta', notice: mensaje}
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
