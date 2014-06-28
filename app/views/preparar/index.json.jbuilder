json.array!(@ventas) do |venta|
  #json.extract! venta, :id, :vendedor_id, :fecha_hora, :nombre_cliente, :precio_total, :comentario_perdida, :numero_de_caja, :estado_venta, :tiempo_terminado_venta
  json.extract! venta, :detalle, :basico, :compuesto, :id, :vendedor_id, :fecha_hora, :nombre_cliente, :precio_total, :comentario_perdida, :numero_de_caja
  json.url venta_url(venta, format: :json)
end

#json.array!(@ventas) do |venta|
  ##json.extract! venta, :id, :vendedor_id, :fecha_hora, :nombre_cliente, :precio_total, :comentario_perdida, :numero_de_caja, :estado_venta, :tiempo_terminado_venta
  #json.extract! venta, :detalle, :id, :vendedor_id, :fecha_hora, :nombre_cliente, :precio_total, :comentario_perdida, :numero_de_caja
  #basico = Array.new
  #compuesto = Array.new
  #ventas = Venta.all.where(:estado_venta => [Venta::EMITIDA, Venta::PREPARANDO])
	#ventas.each do | venta |
			#detalles = Detalle.where(venta_id: venta.id)
			#detalles.each do | detalle |
	  		#if detalle.basico_id #si es basico
		  		###producto = Detalle.where(venta_id: venta.id, basico_id: detalle.basico_id)
		  		#producto = Basico.find(detalle.basico_id)
		  		#producto.cantidad = 15
		  		#producto.tipo = 'basico'
		  		#basico.push producto
		  		##basico.cantidad = detalle.cantidad
		  	#end
	  	#end
	#end
  #json.url venta_url(venta, format: :json)
#end