json.array!(@proveedors) do |proveedor|
  json.extract! proveedor, :id, :rut_proveedor, :nombre_proveedor, :telefono_proveedor, :email_proveedor
  json.url proveedor_url(proveedor, format: :json)
end
