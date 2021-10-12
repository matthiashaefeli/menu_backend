class Order < ApplicationRecord
  belongs_to :dinner
  belongs_to :menu_item
  belongs_to :menu_type
end
