json.array!(@detalles) do |detalle|
  json.extract! detalle, :id, :compuesto_id, :basico_id, :estado, :tiempo_entrega, :tiempo_en_espera, :tiempo_preparando, :tiempo_terminado, :tiempo_entregado_deseachado, :intento_entrega, :precio
  json.url detalle_url(detalle, format: :json)
end
