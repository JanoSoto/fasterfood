json.array!(@merma_vencimientos) do |merma_vencimiento|
  json.extract! merma_vencimiento, :id, :cantidad, :fecha_merma, :lote_id
  json.url merma_vencimiento_url(merma_vencimiento, format: :json)
end
