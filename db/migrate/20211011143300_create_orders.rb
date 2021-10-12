class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :dinner_id
      t.integer :menu_item_id
      t.integer :menu_type_id

      t.timestamps
    end
  end
end
