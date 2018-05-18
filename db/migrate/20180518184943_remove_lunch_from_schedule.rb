class RemoveLunchFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :lunch, :text
  end
end
