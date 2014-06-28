class CreateMermaMaterials < ActiveRecord::Migration
  def change
    create_table :merma_materials do |t|
      t.integer :cantidad_merma
      t.datetime :fecha_merma
      t.string :comentario_merma
      t.references :ingredientes, index: true

      t.timestamps
    end
  end
end
