class CompuestosController < ApplicationController
  #check_authorization
  load_and_authorize_resource param_method: :compuesto_params
  #before_filter :authenticate_user!, :except => [:index, :show]
  before_action :set_compuesto, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  # GET /compuestos
  # GET /compuestos.json
  def index
    @compuestos = Compuesto.all
  end

  # GET /compuestos/1
  # GET /compuestos/1.json
  def show
  end

  # GET /compuestos/new
  def new
    @compuesto = Compuesto.new
  end

  # GET /compuestos/1/edit
  def edit
  end

  # POST /compuestos
  # POST /compuestos.json
  def create
    @compuesto = Compuesto.new(compuesto_params)
    @compuesto.nombre_producto = @compuesto.nombre_producto.strip

    respond_to do |format|
      basicos = Array.new
      if !params[:compuesto][:basico].nil?
          params[:compuesto][:basico].each do | basico |
              basicos.push(:id => basico['id'], :cantidad => basico['cantidad'])
          end
      end

      i = 0
      @compuesto.basico = Array.new
      @compuesto.composicion = Array.new

      basicos.each do | basico |
        basico_nuevo = Basico.find(basico[:id])
        @compuesto.basico.push basico_nuevo
        @compuesto.composicion[i].cantidad = basico[:cantidad]
        i = i + 1
      end
      #@compuesto.errors.add :nombre_poducto, params.inspect
      #raise 'An error has occured'
      if @compuesto.save
        format.html { redirect_to @compuesto, notice: 'Compuesto was successfully created.' }
        format.json { render :show, status: :created, location: @compuesto }
      else
        format.html { render :new }
        format.json { render json: @compuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compuestos/1
  # PATCH/PUT /compuestos/1.json
  def update
    #raise 'An error has occured'  
    respond_to do |format|
      basicos = Array.new
      if !params[:compuesto][:basico].nil?
          params[:compuesto][:basico].each do | basico |
              basicos.push(:id => basico['id'], :cantidad => basico['cantidad'])
          end
      end

      i = 0
      @compuesto.basico = Array.new
      @compuesto.composicion = Array.new

      basicos.each do | basico |
        basico_nuevo = Basico.find(basico[:id])
        @compuesto.basico.push basico_nuevo
        @compuesto.composicion[i].cantidad = basico[:cantidad]
        i = i + 1
      end

      parametros = compuesto_params
      parametros[:nombre_producto] = parametros[:nombre_producto].strip.downcase

      if @compuesto.update(parametros)
        format.html { redirect_to edit_compuesto_path(@compuesto), notice: 'Producto actualizado correctamente !' }
        format.json { render :show, status: :ok, location: @compuesto }
      else
        format.html { render :edit }
        format.json { render json: @compuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compuestos/1
  # DELETE /compuestos/1.json
  def destroy
    #@compuesto.destroy
    @compuesto.en_venta = !@compuesto.en_venta
    @compuesto.save
    respond_to do |format|
      format.html { redirect_to compuestos_url, notice: 'Estado cambiado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compuesto
      @compuesto = Compuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compuesto_params
      params.require(:compuesto).permit(:precio, :nombre_producto, :en_venta,
        #:basicos => [:precio, :nombre_producto, :en_venta]
        #:composicions_attributes => [:cantidad,
          #basico_attributes[:id, :cantidad],
          #:composicion_attributes => [:cantidad]
        #],
      )
    end
end
