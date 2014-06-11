class CreateBasicos < ActiveRecord::Migration
  def change
    create_table :basicos do |t|

      t.timestamps
    end
  end
end
