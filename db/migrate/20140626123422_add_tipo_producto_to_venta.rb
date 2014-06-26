class AddTipoProductoToVenta < ActiveRecord::Migration
  def change
    add_column :venta, :tipo_producto, :string, limit: 9
  end
end
