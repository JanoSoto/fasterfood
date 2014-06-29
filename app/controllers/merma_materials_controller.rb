class MermaMaterialsController < ApplicationController
  before_action :set_merma_material, only: [:show, :edit, :update, :destroy]

  # GET /merma_materials
  # GET /merma_materials.json
  def index
    @merma_materials = MermaMaterial.all
  end

  # GET /merma_materials/1
  # GET /merma_materials/1.json
  def show
  end

  # GET /merma_materials/new
  def new
    @merma_material = MermaMaterial.new
  end

  # GET /merma_materials/1/edit
  def edit
  end

  # POST /merma_materials
  # POST /merma_materials.json
  def create
    @merma_material = MermaMaterial.new(merma_material_params)

    respond_to do |format|
      if @merma_material.save
        format.html { redirect_to @merma_material, notice: 'Merma material was successfully created.' }
        format.json { render :show, status: :created, location: @merma_material }
      else
        format.html { render :new }
        format.json { render json: @merma_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merma_materials/1
  # PATCH/PUT /merma_materials/1.json
  def update
    respond_to do |format|
      if @merma_material.update(merma_material_params)
        format.html { redirect_to @merma_material, notice: 'Merma material was successfully updated.' }
        format.json { render :show, status: :ok, location: @merma_material }
      else
        format.html { render :edit }
        format.json { render json: @merma_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merma_materials/1
  # DELETE /merma_materials/1.json
  def destroy
    @merma_material.destroy
    respond_to do |format|
      format.html { redirect_to merma_materials_url, notice: 'Merma material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merma_material
      @merma_material = MermaMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merma_material_params
      params.require(:merma_material).permit(:cantidad_merma, :fecha_merma, :comentario_merma, :ingredientes_id)
    end
end
