class CreateDetallesBasicosController < ApplicationController
  before_action :set_create_detalles_basico, only: [:show, :edit, :update, :destroy]

  # GET /create_detalles_basicos
  # GET /create_detalles_basicos.json
  def index
    @create_detalles_basicos = CreateDetallesBasico.all
  end

  # GET /create_detalles_basicos/1
  # GET /create_detalles_basicos/1.json
  def show
  end

  # GET /create_detalles_basicos/new
  def new
    @create_detalles_basico = CreateDetallesBasico.new
  end

  # GET /create_detalles_basicos/1/edit
  def edit
  end

  # POST /create_detalles_basicos
  # POST /create_detalles_basicos.json
  def create
    @create_detalles_basico = CreateDetallesBasico.new(create_detalles_basico_params)

    respond_to do |format|
      if @create_detalles_basico.save
        format.html { redirect_to @create_detalles_basico, notice: 'Create detalles basico was successfully created.' }
        format.json { render :show, status: :created, location: @create_detalles_basico }
      else
        format.html { render :new }
        format.json { render json: @create_detalles_basico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_detalles_basicos/1
  # PATCH/PUT /create_detalles_basicos/1.json
  def update
    respond_to do |format|
      if @create_detalles_basico.update(create_detalles_basico_params)
        format.html { redirect_to @create_detalles_basico, notice: 'Create detalles basico was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_detalles_basico }
      else
        format.html { render :edit }
        format.json { render json: @create_detalles_basico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_detalles_basicos/1
  # DELETE /create_detalles_basicos/1.json
  def destroy
    @create_detalles_basico.destroy
    respond_to do |format|
      format.html { redirect_to create_detalles_basicos_url, notice: 'Create detalles basico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_detalles_basico
      @create_detalles_basico = CreateDetallesBasico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_detalles_basico_params
      params.require(:create_detalles_basico).permit(:basico_id, :ingrediente_id, :cantidad)
    end
end
