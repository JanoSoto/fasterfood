json.array!(@vendedors) do |vendedor|
  json.extract! vendedor, :id, :rut, :nombre, :apellido_paterno, :apellido_materno, :telefono, :user_id
  json.url vendedor_url(vendedor, format: :json)
end
