json.array!(@detalles_basicos) do |detalles_basico|
  json.extract! detalles_basico, :id, :basico_id, :ingrediente_id, :cantidad
  json.url detalles_basico_url(detalles_basico, format: :json)
end
