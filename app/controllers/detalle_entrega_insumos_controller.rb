class DetalleEntregaInsumosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_detalle_entrega_insumo, only: [:show, :edit, :update, :destroy]

  # GET /detalle_entrega_insumos
  # GET /detalle_entrega_insumos.json
  def index
    @detalle_entrega_insumos = DetalleEntregaInsumo.all
  end

  # GET /detalle_entrega_insumos/1
  # GET /detalle_entrega_insumos/1.json
  def show
  end

  # GET /detalle_entrega_insumos/new
  def new
    @detalle_entrega_insumo = DetalleEntregaInsumo.new
  end

  # GET /detalle_entrega_insumos/1/edit
  def edit
  end

  # POST /detalle_entrega_insumos
  # POST /detalle_entrega_insumos.json
  def create
    @detalle_entrega_insumo = DetalleEntregaInsumo.new(detalle_entrega_insumo_params)

    respond_to do |format|
      if @detalle_entrega_insumo.save
        format.html { redirect_to @detalle_entrega_insumo, notice: 'Detalle entrega insumo was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_entrega_insumo }
      else
        format.html { render :new }
        format.json { render json: @detalle_entrega_insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_entrega_insumos/1
  # PATCH/PUT /detalle_entrega_insumos/1.json
  def update
    respond_to do |format|
      if @detalle_entrega_insumo.update(detalle_entrega_insumo_params)
        format.html { redirect_to @detalle_entrega_insumo, notice: 'Detalle entrega insumo was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_entrega_insumo }
      else
        format.html { render :edit }
        format.json { render json: @detalle_entrega_insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_entrega_insumos/1
  # DELETE /detalle_entrega_insumos/1.json
  def destroy
    @detalle_entrega_insumo.destroy
    respond_to do |format|
      format.html { redirect_to detalle_entrega_insumos_url, notice: 'Detalle entrega insumo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_entrega_insumo
      @detalle_entrega_insumo = DetalleEntregaInsumo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_entrega_insumo_params
      params.require(:detalle_entrega_insumo).permit(:precio, :cantidad, :insumo_id, :entrega_id)
    end
end
