json.array!(@merma_ingredientes) do |merma_ingrediente|
  json.extract! merma_ingrediente, :id, :cantidad, :fecha_merma, :comentario_merma, :ingrediente_id
  json.url merma_ingrediente_url(merma_ingrediente, format: :json)
end
