class RemoveCoffeeIdFromRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratings, :coffee_id, :integer
  end
end
