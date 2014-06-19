json.array!(@ingredientes) do |ingrediente|
  json.extract! ingrediente, :id, :refrigerado, :nombre, :categoria, :stock_actual, :stock_critico, :stock_ideal
  json.url ingrediente_url(ingrediente, format: :json)
end
