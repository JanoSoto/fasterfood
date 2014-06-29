class CreateComposicion < ActiveRecord::Migration
  def change
    create_table :composicions do |t|
      t.integer :basico_id
      t.integer :compuesto_id
      t.integer :cantidad
    end
  end
end
