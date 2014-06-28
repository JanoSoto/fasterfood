class BasicosController < ApplicationController
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

    respond_to do |format|
      if @basico.save
        format.html { redirect_to @basico, notice: 'Basico was successfully created.' }
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

      if @basico.update(parametros)
        format.html { redirect_to @basico, notice: 'Basico was successfully updated.' }
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
    @basico.destroy
    respond_to do |format|
      format.html { redirect_to basicos_url, notice: 'Basico was successfully destroyed.' }
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
