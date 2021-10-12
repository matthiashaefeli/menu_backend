FactoryBot.define do
  factory :dinner do
    trait :with_restaurant do
      association :restaurant, factory: :restaurant
    end
  end
end
