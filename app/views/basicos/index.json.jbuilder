json.array!(@basicos) do |basico|
  json.extract! basico, :id, :precio, :nombre_producto, :en_venta
  json.url basico_url(basico, format: :json)
end
