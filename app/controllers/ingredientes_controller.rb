class IngredientesController < ApplicationController
  #check_authorization
  before_filter :authenticate_user!
  #load_and_authorize_resource
  before_action :set_ingrediente, only: [:show, :edit, :update, :destroy]
  skip_authorization_check

  # GET /ingredientes
  # GET /ingredientes.json
  def index
    if current_user.rol != User::ADMINISTRADOR
      raise CanCan::AccessDenied
    end
    @ingredientes = Ingrediente.all
  end

  # GET /ingredientes/1
  # GET /ingredientes/1.json
  def show
    if current_user.rol != User::ADMINISTRADOR
      raise CanCan::AccessDenied
    end
  end

  # GET /ingredientes/new
  def new
    if current_user.rol != User::ADMINISTRADOR
      raise CanCan::AccessDenied
    end
    @ingrediente = Ingrediente.new
  end

  # GET /ingredientes/1/edit
  def edit
    if current_user.rol != User::ADMINISTRADOR
      raise CanCan::AccessDenied
    end
  end

  # POST /ingredientes
  # POST /ingredientes.json
  def create
    if current_user.rol != User::ADMINISTRADOR
      raise CanCan::AccessDenied
    end
    @edit = false
    @ingrediente = Ingrediente.new(ingrediente_params)
    @ingrediente.nombre = @ingrediente.nombre.strip.downcase
    @ingrediente.refrigerado = false

    respond_to do |format|
      if @ingrediente.save
        format.html { redirect_to @ingrediente, notice: 'Ingrediente creado con éxito.' }
        format.json { render :show, status: :created, location: @ingrediente }
      else
        format.html { render :new }
        format.json { render json: @ingrediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredientes/1
  # PATCH/PUT /ingredientes/1.json
  def update
    if current_user.rol != User::ADMINISTRADOR
      raise CanCan::AccessDenied
    end
    @edit = true
    respond_to do |format|
      params[:nombre] = params[:nombre].strip.downcase
      
      if @ingrediente.update(ingrediente_params)
        format.html { redirect_to @ingrediente, notice: 'Ingrediente actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @ingrediente }
      else
        format.html { render :edit }
        format.json { render json: @ingrediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredientes/1
  # DELETE /ingredientes/1.json
  def destroy
    if current_user.rol != User::ADMINISTRADOR
      raise CanCan::AccessDenied
    end
    @ingrediente.destroy
    respond_to do |format|
      format.html { redirect_to ingredientes_url, notice: 'Ingrediente eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingrediente
      @ingrediente = Ingrediente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingrediente_params
      params.require(:ingrediente).permit(:refrigerado, :nombre, :categoria, :stock_actual, :stock_critico, :stock_ideal)
    end
end
