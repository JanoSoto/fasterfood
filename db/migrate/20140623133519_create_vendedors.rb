class CreateVendedors < ActiveRecord::Migration
  def change
    create_table :vendedors do |t|
      t.integer :rut
      t.string :nombre, limit: 20
      t.string :apellido_paterno, limit: 20
      t.string :apellido_materno, limit: 20
      t.integer :telefono, limit: 8
      t.integer :user_id

      t.timestamps
    end
  end
end
