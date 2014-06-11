json.array!(@compuestos) do |compuesto|
  json.extract! compuesto, :id, :precio, :nombre_producto, :en_venta
  json.url compuesto_url(compuesto, format: :json)
end
