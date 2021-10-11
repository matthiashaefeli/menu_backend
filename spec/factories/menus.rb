# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    title { Faker::Restaurant.name }

    trait :with_restaurant do
      association :restaurant, factory: :restaurant
    end
  end
end
