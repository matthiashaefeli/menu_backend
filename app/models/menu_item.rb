# frozen_string_literal: true

class MenuItem < ApplicationRecord
  has_many :menu_menu_items
  has_many :menus, through: :menu_menu_items
  has_many :orders

  validates :name, :description, :price, presence: true
  validates_uniqueness_of :name
end
