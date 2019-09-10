class AddBrewToCups < ActiveRecord::Migration[5.2]
  def change
    add_column :cups, :brew_id, :integer
  end
end
