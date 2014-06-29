class DetallesBasicosController < ApplicationController
  before_action :set_detalles_basico, only: [:show, :edit, :update, :destroy]

  # GET /detalles_basicos
  # GET /detalles_basicos.json
  def index
    @detalles_basicos = DetallesBasico.all
  end

  # GET /detalles_basicos/1
  # GET /detalles_basicos/1.json
  def show
  end

  # GET /detalles_basicos/new
  def new
    @detalles_basico = DetallesBasico.new
  end

  # GET /detalles_basicos/1/edit
  def edit
  end

  # POST /detalles_basicos
  # POST /detalles_basicos.json
  def create
    @detalles_basico = DetallesBasico.new(detalles_basico_params)

    respond_to do |format|
      if @detalles_basico.save
        format.html { redirect_to @detalles_basico, notice: 'Detalles basico was successfully created.' }
        format.json { render :show, status: :created, location: @detalles_basico }
      else
        format.html { render :new }
        format.json { render json: @detalles_basico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalles_basicos/1
  # PATCH/PUT /detalles_basicos/1.json
  def update
    respond_to do |format|
      if @detalles_basico.update(detalles_basico_params)
        format.html { redirect_to @detalles_basico, notice: 'Detalles basico was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalles_basico }
      else
        format.html { render :edit }
        format.json { render json: @detalles_basico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles_basicos/1
  # DELETE /detalles_basicos/1.json
  def destroy
    @detalles_basico.destroy
    respond_to do |format|
      format.html { redirect_to detalles_basicos_url, notice: 'Detalles basico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalles_basico
      @detalles_basico = DetallesBasico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalles_basico_params
      params.require(:detalles_basico).permit(:basico_id, :ingrediente_id, :cantidad)
    end
end
