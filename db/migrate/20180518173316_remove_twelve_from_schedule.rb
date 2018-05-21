class RemoveTwelveFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :twelve, :text
  end
end
