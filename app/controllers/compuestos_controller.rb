class CompuestosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :set_compuesto, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
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
    respond_to do |format|
      if @compuesto.update(compuesto_params)
        format.html { redirect_to @compuesto, notice: 'Compuesto was successfully updated.' }
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
    @compuesto.destroy
    respond_to do |format|
      format.html { redirect_to compuestos_url, notice: 'Compuesto was successfully destroyed.' }
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
      params.require(:compuesto).permit(:precio, :nombre_producto, :en_venta)
    end
end
