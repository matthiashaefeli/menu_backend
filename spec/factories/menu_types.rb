# frozen_string_literal: true

FactoryBot.define do
  factory :menu_type do
    name { Faker::Restaurant.type }
  end
end
