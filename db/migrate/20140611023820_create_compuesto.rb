class CreateCompuesto < ActiveRecord::Migration
  def change
    create_table :compuestos do |t|
      t.integer :precio
      t.string :nombre_producto
      t.boolean :en_venta
    end
  end
end
