# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    association :dinner, factory: :dinner
    association :menu_item, factory: :menu_item
    association :menu_type, factory: :menu_type
  end
end
