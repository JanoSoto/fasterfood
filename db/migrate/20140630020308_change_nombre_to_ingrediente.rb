class ChangeNombreToIngrediente < ActiveRecord::Migration
  def change
  	change_column :ingredientes, :nombre, :string, :limit => 50
  end
end
