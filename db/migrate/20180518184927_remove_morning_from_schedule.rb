class RemoveMorningFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :morning, :text
  end
end
