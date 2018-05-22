class AddLongitudeToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :longitude, :float
  end
end
