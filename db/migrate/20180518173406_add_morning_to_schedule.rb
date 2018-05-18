class AddMorningToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :morning, :text
  end
end
