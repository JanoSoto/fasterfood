class RemoveCategoriaInsumoToInsumos < ActiveRecord::Migration
  def change
  	remove_column :insumos, :categoria_insumo, :string
  end
end
