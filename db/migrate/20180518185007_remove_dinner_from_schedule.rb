class RemoveDinnerFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :dinner, :text
  end
end
