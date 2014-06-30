class CreateMermaVencimientos < ActiveRecord::Migration
  def change
    create_table :merma_vencimientos do |t|
      t.integer :cantidad
      t.date :fecha_merma
      t.references :lote, index: true

      t.timestamps
    end
  end
end
