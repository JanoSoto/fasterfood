class AgregarValorPorDefectoAComentarioPerdida < ActiveRecord::Migration
  def change
	change_column :venta, :comentario_perdida, :string, :limit => 200, :null => false, :default => ''
  end
end
