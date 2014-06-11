json.array!(@alerta_obsolescencia) do |alerta_obsolescencium|
  json.extract! alerta_obsolescencium, :id, :tiempo_emision, :visualizada, :necesidad_cubierta, :lote_id, :mensaje
  json.url alerta_obsolescencium_url(alerta_obsolescencium, format: :json)
end
