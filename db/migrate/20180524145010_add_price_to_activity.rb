class AddPriceToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :price, :text
  end
end
