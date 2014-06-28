class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.datetime :fecha_hora_llegada
      t.date :fecha_vencimiento
      t.references :ingrediente, index: true

      t.timestamps
    end
  end
end
