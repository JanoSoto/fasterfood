class BasicosController < ApplicationController
  check_authorization
  before_filter :authenticate_user!
  load_and_authorize_resource param_method: :basico_params
  before_action :set_basico, only: [:show, :edit, :update, :destroy]

  # GET /basicos
  # GET /basicos.json
  def index
    @basicos = Basico.all
  end

  # GET /basicos/1
  # GET /basicos/1.json
  def show
  end

  # GET /basicos/new
  def new
    @basico = Basico.new
  end

  # GET /basicos/1/edit
  def edit
  end

  # POST /basicos
  # POST /basicos.json
  def create
    @basico = Basico.new(basico_params)
    @basico.nombre_producto = @basico.nombre_producto.strip.downcase

    respond_to do |format|
      # ANADIR INGREDIENTES
      ingredientes = Array.new
      if !params[:basico][:ingredientes].nil?
          params[:basico][:ingredientes].each do | ingrediente |
              ingredientes.push(:id => ingrediente['id'], :cantidad => ingrediente['cantidad'])
          end
      end

      i = 0
      @basico.ingredientes = Array.new
      @basico.detalles_basicos = Array.new
      #@compuesto.composicion = Array.new

      ingredientes.each do | ingrediente |
        ingrediente_nuevo = Ingrediente.find(ingrediente[:id])
        @basico.ingredientes.push ingrediente_nuevo
        @basico.detalles_basicos[i].cantidad = ingrediente[:cantidad]
        i = i + 1
      end 

      # / ANADIR INGREDIENTES

      if @basico.ingredientes.any?
        tiene_ingredientes = true
      else
        tiene_ingredientes = false
        @basico.errors.add :general, "Debe agregar a lo menos un ingrediente."
      end

      if tiene_ingredientes and @basico.save
        format.html { redirect_to @basico, notice: 'Producto creado correctamente.' }
        format.json { render :show, status: :created, location: @basico }
      else
        format.html { render :new }
        format.json { render json: @basico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basicos/1
  # PATCH/PUT /basicos/1.json
  def update
    respond_to do |format|

        parametros = basico_params
        parametros[:nombre_producto] = parametros[:nombre_producto].strip.downcase

        # ANADIR INGREDIENTES
        ingredientes = Array.new
        if !params[:basico][:ingredientes].nil?
            params[:basico][:ingredientes].each do | ingrediente |
                ingredientes.push(:id => ingrediente['id'], :cantidad => ingrediente['cantidad'])
            end
        end

        i = 0
        @basico.ingredientes = Array.new
        @basico.detalles_basicos = Array.new
        #@compuesto.composicion = Array.new

        ingredientes.each do | ingrediente |
          ingrediente_nuevo = Ingrediente.find(ingrediente[:id])
          @basico.ingredientes.push ingrediente_nuevo
          @basico.detalles_basicos[i].cantidad = ingrediente[:cantidad]
          i = i + 1
        end 

        #raise @basico.detalles_basicos.inspect

        # / ANADIR INGREDIENTES
        
        @basico.valid?
        if @basico.ingredientes.any?
          tiene_ingredientes = true
        else
          tiene_ingredientes = false
          @basico.errors.add :general, "Debe agregar a lo menos un ingrediente."
        end

      if tiene_ingredientes and @basico.update(parametros)
        format.html { redirect_to @basico, notice: 'Producto actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @basico }
      else
        format.html { render :edit }
        format.json { render json: @basico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basicos/1
  # DELETE /basicos/1.json
  def destroy
    @basico.en_venta = !@basico.en_venta
    @basico.save
    respond_to do |format|
      format.html { redirect_to basicos_url, notice: 'Estado cambiado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basico
      @basico = Basico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basico_params
      params.require(:basico).permit(:precio, :nombre_producto, :en_venta)
    end
end
