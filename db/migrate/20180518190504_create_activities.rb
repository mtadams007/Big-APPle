class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :time_slot
      t.integer :schedule_id
      t.string :business_identity
      t.string :image_url
      t.string :name
      t.string :title
      t.float :rating
      t.string :url
      t.text :address
      t.string :phone
      t.float :distance
      t.integer :open
      t.integer :close

      t.timestamps
    end
  end
end
