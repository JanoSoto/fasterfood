class CreateDetalles < ActiveRecord::Migration
  def change
    create_table :detalles do |t|
      t.integer :compuesto_id
      t.integer :basico_id
      t.string :estado, limit: 20
      t.datetime :tiempo_entrega
      t.datetime :tiempo_en_espera
      t.datetime :tiempo_preparando
      t.datetime :tiempo_terminado
      t.datetime :tiempo_entregado_deseachado
      t.integer :intento_entrega
      t.integer :precio

      t.timestamps
    end
  end
end
