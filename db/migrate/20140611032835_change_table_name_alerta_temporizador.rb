class ChangeTableNameAlertaTemporizador < ActiveRecord::Migration
  def change
  	rename_table :alerta_temporizadors, :alerta_temporizador
  end
end
