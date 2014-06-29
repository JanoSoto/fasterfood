class CreateEntregas < ActiveRecord::Migration
  def change
    create_table :entregas do |t|
      t.datetime :fecha_hora_entrega
      t.references :proveedor, index: true

      t.timestamps
    end
  end
end
