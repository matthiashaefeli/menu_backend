# frozen_string_literal: true

class Dinner < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user, optional: true
  has_many :orders

  def complete_order
    orders.each_with_object({}) do |order, hash|
      menu_type = order.menu_type.name
      menu_item = order.menu_item.name
      if hash.key? menu_type
        hash[menu_type] << menu_item
      else
        hash[menu_type] = [menu_item]
      end
    end
  end
end
