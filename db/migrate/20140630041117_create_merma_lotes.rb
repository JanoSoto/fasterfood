class CreateMermaLotes < ActiveRecord::Migration
  def change
    create_table :merma_lotes do |t|
      t.integer :cantidad
      t.date :fecha_merma
      t.integer :comentario
      t.references :lote, index: true

      t.timestamps
    end
  end
end
