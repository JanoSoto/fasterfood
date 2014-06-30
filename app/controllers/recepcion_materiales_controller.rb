class RecepcionMaterialesController < ApplicationController
  before_filter :authenticate_user!
  def insumos
    @cantidad = params[:cantidad]
    @insumo = Insumo.find(params[:ins]['id'])

    if @insumo      
      nuevo_stock = @insumo.stock_actual + params[:cantidad].to_i
      @insumo.update(stock_actual: nuevo_stock.to_i)
    end

  end

  def ingredientes
  	#@ingrediente = params[:ing]
    #@cantidad = params[:cantidad]
    
    if params[:ing] 
      @ingrediente = Ingrediente.find(params[:ing]['id'])
      nuevo_stock = @ingrediente.stock_actual + params[:cantidad].to_i
      @ingrediente.update(stock_actual: nuevo_stock.to_i)

      #numero_lote = params[:num_lote]
      fecha = params[:lote]
      date = Date.new fecha["fecha_venc(1i)"].to_i, fecha["fecha_venc(2i)"].to_i, fecha["fecha_venc(3i)"].to_i

      lote = Lote.create(fecha_hora_llegada: Time.now, fecha_vencimiento: date, numero_lote: params[:num_lote], ingrediente_id: params[:ing]['id'])
    end

  end
end
