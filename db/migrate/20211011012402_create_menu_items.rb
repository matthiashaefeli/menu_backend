class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.integer :menu_id
      t.string :description
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
