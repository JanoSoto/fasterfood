class CreateInsumos < ActiveRecord::Migration
  def change
    create_table :insumos do |t|
      t.string :tipo_insumo
      t.string :nombre_insumo
      t.string :categoria_insumo
      t.integer :stock_actual
      t.integer :stock_critico
      t.integer :stock_ideal

      t.timestamps
    end
  end
end
