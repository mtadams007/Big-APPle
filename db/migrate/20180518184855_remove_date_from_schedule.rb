class RemoveDateFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :date, :date
  end
end
