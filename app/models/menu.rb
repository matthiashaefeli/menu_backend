# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_menu_items
  has_many :menu_items, through: :menu_menu_items

  validates :title, presence: true
end
