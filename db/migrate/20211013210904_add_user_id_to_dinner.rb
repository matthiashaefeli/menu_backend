class AddUserIdToDinner < ActiveRecord::Migration[6.0]
  def change
    add_column :dinners, :user_id, :integer
  end
end
