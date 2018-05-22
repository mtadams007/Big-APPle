class AddOneToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :one, :text
  end
end
