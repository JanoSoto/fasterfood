class AddVentaIdToDetalle < ActiveRecord::Migration
  def change
	add_column :detalles, :venta_id, :integer
  end
end
