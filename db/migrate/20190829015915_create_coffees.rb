class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :roast
      t.integer :rating
      t.integer :roaster_id

      t.timestamps
    end
  end
end
