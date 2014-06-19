class CreateIngredientes < ActiveRecord::Migration
  def change
    create_table :ingredientes do |t|
      t.boolean :refrigerado
      t.string :nombre, limit: 20
      t.string :categoria, limit: 20
      t.integer :stock_actual
      t.integer :stock_critico
      t.integer :stock_ideal

      t.timestamps
    end
  end
end
