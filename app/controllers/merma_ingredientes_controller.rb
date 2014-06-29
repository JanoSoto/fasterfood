class MermaIngredientesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_merma_ingrediente, only: [:show, :edit, :update, :destroy]

  # GET /merma_ingredientes
  # GET /merma_ingredientes.json
  def index
    @merma_ingredientes = MermaIngrediente.all
  end

  # GET /merma_ingredientes/1
  # GET /merma_ingredientes/1.json
  def show
  end

  # GET /merma_ingredientes/new
  def new
    @merma_ingrediente = MermaIngrediente.new
  end

  # GET /merma_ingredientes/1/edit
  def edit
  end

  # POST /merma_ingredientes
  # POST /merma_ingredientes.json
  def create
    @merma_ingrediente = MermaIngrediente.new(merma_ingrediente_params)

    respond_to do |format|
      if @merma_ingrediente.save
        format.html { redirect_to @merma_ingrediente, notice: 'Merma ingrediente was successfully created.' }
        format.json { render :show, status: :created, location: @merma_ingrediente }
      else
        format.html { render :new }
        format.json { render json: @merma_ingrediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merma_ingredientes/1
  # PATCH/PUT /merma_ingredientes/1.json
  def update
    respond_to do |format|
      if @merma_ingrediente.update(merma_ingrediente_params)
        format.html { redirect_to @merma_ingrediente, notice: 'Merma ingrediente was successfully updated.' }
        format.json { render :show, status: :ok, location: @merma_ingrediente }
      else
        format.html { render :edit }
        format.json { render json: @merma_ingrediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merma_ingredientes/1
  # DELETE /merma_ingredientes/1.json
  def destroy
    @merma_ingrediente.destroy
    respond_to do |format|
      format.html { redirect_to merma_ingredientes_url, notice: 'Merma ingrediente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merma_ingrediente
      @merma_ingrediente = MermaIngrediente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merma_ingrediente_params
      params.require(:merma_ingrediente).permit(:cantidad, :fecha_merma, :comentario_merma, :ingrediente_id)
    end
end
