# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal(l_digits: 2) }

    trait :with_menu do
      association :menu, factory: :menu
    end
  end
end
