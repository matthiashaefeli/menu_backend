# frozen_string_literal: true

FactoryBot.define do
  factory :dinner do
    association :restaurant, factory: :restaurant
  end
end
