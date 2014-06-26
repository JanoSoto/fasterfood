json.array!(@venta) do |ventum|
  json.extract! ventum, :id, :vendedor_id, :fecha_hora, :nombre_cliente, :precio_total, :comentario_perdida, :numero_de_caja, :estado_venta, :tiempo_terminado_venta
  json.url ventum_url(ventum, format: :json)
end
