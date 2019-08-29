class CreateCups < ActiveRecord::Migration[5.2]
  def change
    create_table :cups do |t|
      t.string :brew
      t.integer :user_id
      t.integer :coffee_id

      t.timestamps
    end
  end
end
