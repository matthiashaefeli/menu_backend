class CreateMenuMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_menu_items do |t|
      t.integer :menu_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
