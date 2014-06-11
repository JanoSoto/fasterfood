class CreateAlertaStock < ActiveRecord::Migration
  def change
    create_table :alerta_stocks do |t|
      t.integer :ingrediente_id
      t.integer :insumo_id
      t.string :mensaje_alerta_stock
      t.boolean :visualizada
      t.boolean :necesidad_cubierta
      t.datetime :tiempo_emision_alerta_stock
    end
  end
end
