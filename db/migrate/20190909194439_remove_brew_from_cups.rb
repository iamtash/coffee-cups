class RemoveBrewFromCups < ActiveRecord::Migration[5.2]
  def change
    remove_column :cups, :brew, :string
  end
end
