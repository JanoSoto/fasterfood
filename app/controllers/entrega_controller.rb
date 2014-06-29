class EntregaController < ApplicationController
	#before_action :set_entrega, only: [:show, :edit, :update, :destroy]
	def new
    	@entrega = Entrega.new
  	end

  	def create
  		@entrega = Entrega.new(entrega_params)

	    respond_to do |format|
	      if @entrega.save
	        format.html { redirect_to @entrega}
	        format.json { render :show, status: :created, location: @entrega }
	      else
	        format.html { render :new }
	        format.json { render json: @entrega.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrega
      @entrega = Entrega.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrega_params
      params.require(:entrega).prmit(:rut_proveedor, :fecha_hora_entrega)
    end
end
