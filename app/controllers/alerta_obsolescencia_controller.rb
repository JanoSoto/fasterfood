class AlertaObsolescenciaController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_alerta_obsolescencium, only: [:show, :edit, :update, :destroy]

  # GET /alerta_obsolescencia
  # GET /alerta_obsolescencia.json
  def index
    @alerta_obsolescencia = AlertaObsolescencium.all
  end

  # GET /alerta_obsolescencia/1
  # GET /alerta_obsolescencia/1.json
  def show
  end

  # GET /alerta_obsolescencia/new
  def new
    @alerta_obsolescencium = AlertaObsolescencium.new
  end

  # GET /alerta_obsolescencia/1/edit
  def edit
  end

  # POST /alerta_obsolescencia
  # POST /alerta_obsolescencia.json
  def create
    @alerta_obsolescencium = AlertaObsolescencium.new(alerta_obsolescencium_params)

    respond_to do |format|
      if @alerta_obsolescencium.save
        format.html { redirect_to @alerta_obsolescencium, notice: 'Alerta obsolescencium was successfully created.' }
        format.json { render :show, status: :created, location: @alerta_obsolescencium }
      else
        format.html { render :new }
        format.json { render json: @alerta_obsolescencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerta_obsolescencia/1
  # PATCH/PUT /alerta_obsolescencia/1.json
  def update
    respond_to do |format|
      if @alerta_obsolescencium.update(alerta_obsolescencium_params)
        format.html { redirect_to @alerta_obsolescencium, notice: 'Alerta obsolescencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @alerta_obsolescencium }
      else
        format.html { render :edit }
        format.json { render json: @alerta_obsolescencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerta_obsolescencia/1
  # DELETE /alerta_obsolescencia/1.json
  def destroy
    @alerta_obsolescencium.destroy
    respond_to do |format|
      format.html { redirect_to alerta_obsolescencia_url, notice: 'Alerta obsolescencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alerta_obsolescencium
      @alerta_obsolescencium = AlertaObsolescencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alerta_obsolescencium_params
      params.require(:alerta_obsolescencium).permit(:tiempo_emision, :visualizada, :necesidad_cubierta, :lote_id, :mensaje)
    end
end
