class RemoveColumnFromMenuItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_items, :menu_id
  end
end
