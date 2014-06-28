json.array!(@lotes) do |lote|
  json.extract! lote, :id, :fecha_hora_llegada, :fecha_vencimiento, :ingrediente_id
  json.url lote_url(lote, format: :json)
end
