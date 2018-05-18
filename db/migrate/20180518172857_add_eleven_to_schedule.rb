class AddElevenToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :eleven, :text
  end
end
