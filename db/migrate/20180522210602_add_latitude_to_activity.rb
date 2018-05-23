class AddLatitudeToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :latitude, :float
  end
end
