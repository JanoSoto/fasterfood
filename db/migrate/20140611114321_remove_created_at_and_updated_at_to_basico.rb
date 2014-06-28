class RemoveCreatedAtAndUpdatedAtToBasico < ActiveRecord::Migration
  def change
    remove_column :basicos, :created_at, :datetime
    remove_column :basicos, :updated_at, :datetime
  end
end
