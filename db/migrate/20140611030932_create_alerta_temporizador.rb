class CreateAlertaTemporizador < ActiveRecord::Migration
  def change
    create_table :alerta_temporizadors do |t|
      t.datetime :tiempo_emision
      t.boolean :visualizada
      t.boolean :necesidad_cubierta
      t.integer :venta_id
      t.string :mensaje
    end
  end
end
