class CreateMermas < ActiveRecord::Migration
  def change
    create_table :mermas do |t|
      t.integer :cantidad_merma
      t.datetime :fecha_merma
      t.string :comentario_merma

      t.timestamps
    end
  end
end
