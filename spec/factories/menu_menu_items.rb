# frozen_string_literal: true

FactoryBot.define do
  factory :menu_menu_item do
    trait :with_menu_and_items do
      association :menu, factory: [:menu, :with_restaurant]
      association :menu_item, factory: :menu_item
    end

    trait :with_menu do
      association :menu, factory: [:menu, :with_restaurant]
    end
  end
end
