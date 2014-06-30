class MermaVencimientosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_merma_vencimiento, only: [:show, :edit, :update, :destroy]

  # GET /merma_vencimientos
  # GET /merma_vencimientos.json
  def index
    @merma_vencimientos = MermaVencimiento.all
  end

  # GET /merma_vencimientos/1
  # GET /merma_vencimientos/1.json
  def show
  end

  # GET /merma_vencimientos/new
  def new
    @merma_vencimiento = MermaVencimiento.new
  end

  # GET /merma_vencimientos/1/edit
  def edit
  end

  # POST /merma_vencimientos
  # POST /merma_vencimientos.json
  def create
    @merma_vencimiento = MermaVencimiento.new(merma_vencimiento_params)

    respond_to do |format|
      if @merma_vencimiento.save
        format.html { redirect_to @merma_vencimiento, notice: 'Merma vencimiento was successfully created.' }
        format.json { render :show, status: :created, location: @merma_vencimiento }
      else
        format.html { render :new }
        format.json { render json: @merma_vencimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merma_vencimientos/1
  # PATCH/PUT /merma_vencimientos/1.json
  def update
    respond_to do |format|
      if @merma_vencimiento.update(merma_vencimiento_params)
        format.html { redirect_to @merma_vencimiento, notice: 'Merma vencimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @merma_vencimiento }
      else
        format.html { render :edit }
        format.json { render json: @merma_vencimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merma_vencimientos/1
  # DELETE /merma_vencimientos/1.json
  def destroy
    @merma_vencimiento.destroy
    respond_to do |format|
      format.html { redirect_to merma_vencimientos_url, notice: 'Merma vencimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merma_vencimiento
      @merma_vencimiento = MermaVencimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merma_vencimiento_params
      params.require(:merma_vencimiento).permit(:cantidad, :fecha_merma, :lote_id)
    end
end
