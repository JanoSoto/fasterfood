class MermaLotesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_merma_lote, only: [:show, :edit, :update, :destroy]

  # GET /merma_lotes
  # GET /merma_lotes.json
  def index
    @merma_lotes = MermaLote.all
  end

  # GET /merma_lotes/1
  # GET /merma_lotes/1.json
  def show
  end

  # GET /merma_lotes/new
  def new
    @merma_lote = MermaLote.new
  end

  # GET /merma_lotes/1/edit
  def edit
  end

  # POST /merma_lotes
  # POST /merma_lotes.json
  def create
    @merma_lote = MermaLote.new(merma_lote_params)

    respond_to do |format|
      if @merma_lote.save
        format.html { redirect_to @merma_lote, notice: 'Merma lote was successfully created.' }
        format.json { render :show, status: :created, location: @merma_lote }
      else
        format.html { render :new }
        format.json { render json: @merma_lote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merma_lotes/1
  # PATCH/PUT /merma_lotes/1.json
  def update
    respond_to do |format|
      if @merma_lote.update(merma_lote_params)
        format.html { redirect_to @merma_lote, notice: 'Merma lote was successfully updated.' }
        format.json { render :show, status: :ok, location: @merma_lote }
      else
        format.html { render :edit }
        format.json { render json: @merma_lote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merma_lotes/1
  # DELETE /merma_lotes/1.json
  def destroy
    @merma_lote.destroy
    respond_to do |format|
      format.html { redirect_to merma_lotes_url, notice: 'Merma lote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merma_lote
      @merma_lote = MermaLote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merma_lote_params
      params.require(:merma_lote).permit(:cantidad, :fecha_merma, :comentario, :lote_id)
    end
end
