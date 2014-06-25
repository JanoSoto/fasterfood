class AddCantidadToDetalle < ActiveRecord::Migration
  def change
  	add_column :detalles, :cantidad, :integer
  end
end
