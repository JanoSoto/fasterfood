class CreateVenta < ActiveRecord::Migration
  def change
    create_table :venta do |t|
    	t.integer  :vendedor_id, null: false
    	t.datetime :fecha_hora, null: false
    	t.string   :nombre_cliente, limit: 20, null: false
    	t.integer  :precio_total, null: false
    	t.string   :comentario_perdida, limit: 200, null: false
    	t.integer  :numero_de_caja
    	t.string   :estado_venta, limit: 20
    	t.datetime :tiempo_terminado_venta
      	t.timestamps
    end
  end
end
