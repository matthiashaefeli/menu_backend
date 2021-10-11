# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    title { Faker::Restaurant.name }
  end
end
