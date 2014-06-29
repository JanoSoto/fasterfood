class CreateMermaInsumos < ActiveRecord::Migration
  def change
    create_table :merma_insumos do |t|
      t.integer :cantidad_merma
      t.date :fecha_merma
      t.string :comentario_merma
      t.references :insumo, index: true

      t.timestamps
    end
  end
end
