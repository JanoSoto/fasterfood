class ChangeTableNameAlertaStock < ActiveRecord::Migration
  def change
  	rename_table :alerta_stocks, :alerta_stock
  end
end
