class AddNumeroLoteToLotes < ActiveRecord::Migration
  def change
    add_column :lotes, :numero_lote, :integer
  end
end
