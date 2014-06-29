json.array!(@insumos) do |insumo|
  json.extract! insumo, :id, :tipo_insumo, :nombre_insumo, :categoria_insumo, :stock_actual, :stock_critico, :stock_ideal
  json.url insumo_url(insumo, format: :json)
end
