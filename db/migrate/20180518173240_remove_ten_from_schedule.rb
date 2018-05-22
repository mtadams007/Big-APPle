class RemoveTenFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :ten, :text
  end
end
