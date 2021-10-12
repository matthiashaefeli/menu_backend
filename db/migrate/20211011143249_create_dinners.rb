class CreateDinners < ActiveRecord::Migration[6.0]
  def change
    create_table :dinners do |t|
      t.integer :table
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
