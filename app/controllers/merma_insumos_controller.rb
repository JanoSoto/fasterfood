class MermaInsumosController < ApplicationController
  before_action :set_merma_insumo, only: [:show, :edit, :update, :destroy]

  # GET /merma_insumos
  # GET /merma_insumos.json
  def index
    @merma_insumos = MermaInsumo.all
  end

  # GET /merma_insumos/1
  # GET /merma_insumos/1.json
  def show
  end

  # GET /merma_insumos/new
  def new
    @merma_insumo = MermaInsumo.new
  end

  # GET /merma_insumos/1/edit
  def edit
  end

  # POST /merma_insumos
  # POST /merma_insumos.json
  def create
    @merma_insumo = MermaInsumo.new(merma_insumo_params)

    respond_to do |format|
      if @merma_insumo.save
        format.html { redirect_to @merma_insumo, notice: 'Merma insumo was successfully created.' }
        format.json { render :show, status: :created, location: @merma_insumo }
      else
        format.html { render :new }
        format.json { render json: @merma_insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merma_insumos/1
  # PATCH/PUT /merma_insumos/1.json
  def update
    respond_to do |format|
      if @merma_insumo.update(merma_insumo_params)
        format.html { redirect_to @merma_insumo, notice: 'Merma insumo was successfully updated.' }
        format.json { render :show, status: :ok, location: @merma_insumo }
      else
        format.html { render :edit }
        format.json { render json: @merma_insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merma_insumos/1
  # DELETE /merma_insumos/1.json
  def destroy
    @merma_insumo.destroy
    respond_to do |format|
      format.html { redirect_to merma_insumos_url, notice: 'Merma insumo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merma_insumo
      @merma_insumo = MermaInsumo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merma_insumo_params
      params.require(:merma_insumo).permit(:cantidad_merma, :fecha_merma, :comentario_merma, :insumo_id)
    end
end
