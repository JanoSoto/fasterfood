class RecepcionMaterialesController < ApplicationController
  def insumos

  end

  def ingredientes
  	#id = params[:id]
  	#ingrediente= Ingrediente.where(nombre: params[:ingrediente]).take
  	#ingrediente = Ingrediente.find(params[:ingrediente])
  	ingrediente = Ingrediente.find(params[:ingrediente])
    ingrediente.update(stock_actual: params[:cantidad])
  	unless ingrediente == nil
  		#ingrediente.update(stock_actual: params[:cantidad])	
  		#ingrediente.stock_actual = params[:cantidad]
  		#ingrediente.save
  	end
	#ingrediente.update(stock_actual: params[:cantidad])

  end
end
