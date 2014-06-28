json.array!(@merma_materials) do |merma_material|
  json.extract! merma_material, :id, :cantidad_merma, :fecha_merma, :comentario_merma, :ingredientes_id
  json.url merma_material_url(merma_material, format: :json)
end
