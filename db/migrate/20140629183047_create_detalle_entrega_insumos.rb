class CreateDetalleEntregaInsumos < ActiveRecord::Migration
  def change
    create_table :detalle_entrega_insumos do |t|
      t.integer :precio
      t.integer :cantidad
      t.references :insumo, index: true
      t.references :entrega, index: true

      t.timestamps
    end
  end
end
