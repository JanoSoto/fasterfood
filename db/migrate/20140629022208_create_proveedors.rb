class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :rut_proveedor
      t.string :nombre_proveedor
      t.integer :telefono_proveedor
      t.string :email_proveedor

      t.timestamps
    end
  end
end
