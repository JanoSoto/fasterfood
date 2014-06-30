json.array!(@merma_lotes) do |merma_lote|
  json.extract! merma_lote, :id, :cantidad, :fecha_merma, :comentario, :lote_id
  json.url merma_lote_url(merma_lote, format: :json)
end
