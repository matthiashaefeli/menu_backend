# frozen_string_literal: true

class MenuMenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :menu_item
end
