class AddDinnerToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :dinner, :text
  end
end
