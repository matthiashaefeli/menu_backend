# frozen_string_literal: true

class MenuItem < ApplicationRecord
  belongs_to :menu

  validates :name, :description, :price, presence: true
  validates :name, uniqueness: { scope: :menu_id }
end
