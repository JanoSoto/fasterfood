class AddComentarioADetalle < ActiveRecord::Migration
  def change
  	add_column :detalles, :comentario, :string, limit: 20
  end
end
