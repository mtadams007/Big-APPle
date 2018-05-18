class AddLunchToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :lunch, :text
  end
end
