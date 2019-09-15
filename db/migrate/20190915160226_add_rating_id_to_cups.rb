class AddRatingIdToCups < ActiveRecord::Migration[5.2]
  def change
    add_column :cups, :rating_id, :integer
  end
end
