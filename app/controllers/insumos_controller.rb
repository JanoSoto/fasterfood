class InsumosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_insumo, only: [:show, :edit, :update, :destroy]

  
  # GET /insumos
  # GET /insumos.json
  def index
    @insumos = Insumo.all
  end

  # GET /insumos/1
  # GET /insumos/1.json
  def show
  end

  # GET /insumos/new
  def new
    @insumo = Insumo.new
  end

  # GET /insumos/1/edit
  def edit
  end

  # POST /insumos
  # POST /insumos.json
  def create
    @edit = false
    @insumo = Insumo.new(insumo_params)

    respond_to do |format|
      if @insumo.save
        format.html { redirect_to '/insumos', notice: 'Insumo creado correctamente.' }
        format.json { render :show, status: :created, location: @insumo }
      else
        format.html { render :new }
        format.json { render json: @insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insumos/1
  # PATCH/PUT /insumos/1.json
  def update
    @edit = true
    respond_to do |format|
      if @insumo.update(insumo_params)
        format.html { redirect_to '/insumos', notice: 'Insumo editado correctamente.' }
        format.json { render :show, status: :ok, location: @insumo }
      else
        format.html { render :edit }
        format.json { render json: @insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insumos/1
  # DELETE /insumos/1.json
  def destroy
    @insumo.destroy
    respond_to do |format|
      format.html { redirect_to insumos_url, notice: 'Insumo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insumo
      @insumo = Insumo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insumo_params
      params.require(:insumo).permit(:tipo_insumo, :nombre_insumo, :categoria_insumo, :stock_actual, :stock_critico, :stock_ideal)
    end
end
