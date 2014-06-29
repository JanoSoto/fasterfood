json.array!(@merma_insumos) do |merma_insumo|
  json.extract! merma_insumo, :id, :cantidad_merma, :fecha_merma, :comentario_merma, :insumo_id
  json.url merma_insumo_url(merma_insumo, format: :json)
end
