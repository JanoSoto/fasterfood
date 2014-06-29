class RecepcionMaterialesController < ApplicationController
  before_filter :authenticate_user!
  def insumos

  end

  def ingredientes
  	#@ingrediente = params[:ingrediente]
    #@cantidad = params[:cantidad]
    ingrediente = Ingrediente.find(params[:ingrediente])
    nuevo_stock = ingrediete.stock_actual + params[:cantidad]
    ingrediente.update(stock_actual: nuevo_stock)
  end
end
