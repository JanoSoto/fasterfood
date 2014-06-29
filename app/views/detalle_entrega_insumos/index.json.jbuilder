json.array!(@detalle_entrega_insumos) do |detalle_entrega_insumo|
  json.extract! detalle_entrega_insumo, :id, :precio, :cantidad, :insumo_id, :entrega_id
  json.url detalle_entrega_insumo_url(detalle_entrega_insumo, format: :json)
end
