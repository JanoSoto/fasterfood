class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :rut, :integer
    add_column :users, :nombre, :string, limit: 20
    add_column :users, :apellido_paterno, :string, limit: 20
    add_column :users, :apellido_materno, :string, limit: 20
    add_column :users, :telefono, :integer, limit: 8
    add_column :users, :user_id, :integer
  end
end
