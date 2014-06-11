class ChangeTableNameAndAtributeNamesAlertaStock < ActiveRecord::Migration
  def change
  	rename_table = :alerta_stocks, :alerta_stock
  	rename_column :alerta_stocks, :mensaje_alerta_stock, :mensaje
  	rename_column :alerta_stocks, :tiempo_emision_alerta_stock, :tiempo_emision
  end
end
