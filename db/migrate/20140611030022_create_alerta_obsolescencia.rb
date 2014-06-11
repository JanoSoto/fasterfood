class CreateAlertaObsolescencia < ActiveRecord::Migration
  def change
    create_table :alerta_obsolescencia do |t|
      t.string :tiempo_emision_alerta_obsolescencia
      t.boolean :visualizada_alerta_obsolescencia
      t.boolean :necesidad_cubierta_alerta_obsolescencia
      t.integer :lote_id
      t.string :mensaje_alerta_obsolescencia
    end
  end
end
