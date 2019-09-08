class RemoveRatingFromCoffees < ActiveRecord::Migration[5.2]
  def change
    remove_column :coffees, :rating
  end
end
