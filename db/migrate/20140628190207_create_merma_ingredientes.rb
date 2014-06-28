class CreateMermaIngredientes < ActiveRecord::Migration
  def change
    create_table :merma_ingredientes do |t|
      t.integer :cantidad
      t.date :fecha_merma
      t.string :comentario_merma
      t.references :ingrediente, index: true

      t.timestamps
    end
  end
end
