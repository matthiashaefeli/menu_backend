class AddRestaurantIdToMenu < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :restaurant_id, :integer
  end
end
