class RemoveAfternoonFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :afternoon, :text
  end
end
