class AddCantidadToVenta < ActiveRecord::Migration
  def change
  	add_column :venta, :cantidad, :integer
  end
end
