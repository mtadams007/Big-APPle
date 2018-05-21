class AddTwelveToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :twelve, :text
  end
end
