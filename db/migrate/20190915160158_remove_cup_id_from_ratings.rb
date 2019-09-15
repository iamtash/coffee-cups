class RemoveCupIdFromRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratings, :cup_id, :integer
  end
end
