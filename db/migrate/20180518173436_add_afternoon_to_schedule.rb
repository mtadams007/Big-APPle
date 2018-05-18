class AddAfternoonToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :afternoon, :text
  end
end
