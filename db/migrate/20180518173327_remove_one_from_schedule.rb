class RemoveOneFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :one, :text
  end
end
