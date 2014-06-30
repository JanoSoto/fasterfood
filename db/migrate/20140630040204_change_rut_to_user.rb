class ChangeRutToUser < ActiveRecord::Migration
  def change
  	change_column :users, :rut, :string, :limit => 9
  end
end
