class ChangeAttributeNamesAlertaObsolescencia < ActiveRecord::Migration
  def change
  	rename_column :alerta_obsolescencia, :tiempo_emision_alerta_obsolescencia, :tiempo_emision
  	rename_column :alerta_obsolescencia, :visualizada_alerta_obsolescencia, :visualizada
  	rename_column :alerta_obsolescencia, :necesidad_cubierta_alerta_obsolescencia, :necesidad_cubierta
  	rename_column :alerta_obsolescencia, :mensaje_alerta_obsolescencia, :mensaje
  end
end
