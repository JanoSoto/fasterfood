class CreateDetallesBasicos < ActiveRecord::Migration
  def change
    create_table :detalles_basicos do |t|
      t.integer :basico_id
      t.integer :ingrediente_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
