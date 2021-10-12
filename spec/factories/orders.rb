FactoryBot.define do
  factory :order do
    association :dinner, factory: [:dinner, :with_restaurant]
    association :menu_item, factory: :menu_item
    association :menu_type, factory: :menu_type
  end
end
