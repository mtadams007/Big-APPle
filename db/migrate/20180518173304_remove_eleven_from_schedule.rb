class RemoveElevenFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :eleven, :text
  end
end
