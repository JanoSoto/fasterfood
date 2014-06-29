json.array!(@create_detalles_basicos) do |create_detalles_basico|
  json.extract! create_detalles_basico, :id, :basico_id, :ingrediente_id, :cantidad
  json.url create_detalles_basico_url(create_detalles_basico, format: :json)
end
