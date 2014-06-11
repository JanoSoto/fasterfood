class CreateAlertaObsolescencia < ActiveRecord::Migration
  def change
    create_table :alerta_obsolescencia do |t|
      t.string :tiempo_emision
      t.boolean :visualizada
      t.boolean :necesidad_cubierta
      t.integer :lote_id
      t.string :mensaje

      t.timestamps
    end
  end
end
