# frozen_string_literal: true

require_relative '../../lib/prediction_engine.rb'
WEEKDAYS = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze

describe PredictionEngine do
  let(:entree) { create :menu_type, name: 'Entree' }
  let(:side) { create :menu_type, name: 'Side' }
  let(:dish) { create :menu_type, name: 'Standalone Dish' }
  let(:restaurant) { create :restaurant }
  let(:menu_item_list) { create_list :menu_item, 10 }
  let(:user) { create :user }
  let(:user_list) { create_list :user, 3 }
  let(:user_1) { create :user }
  let(:user_2) { create :user }
  let(:menu_item) { create :menu_item, name: 'Fish' }
  let(:dinner_1) do
    create :dinner, restaurant: restaurant,
                    user: user_1,
                    created_at: 1.day.ago
  end
  let(:order_1) do
    create :order, dinner: dinner_1,
                   menu_item: menu_item,
                   menu_type: dish
  end
  let(:dinner_2) do
    create :dinner, restaurant: restaurant,
                    user: user_2,
                    created_at: 1.day.ago
  end
  let(:order_2) do
    create :order, dinner: dinner_2,
                   menu_item: menu_item,
                   menu_type: dish
  end

  def create_dinners_for_user
    3.times do
      create :dinner, restaurant: restaurant,
                      user: user
    end
  end

  def create_dinners_for_user_diff_weekday
    3.times do
      create :dinner, restaurant: restaurant,
                      user: user,
                      created_at: 2.days.ago
    end
  end

  def create_orders_for_user
    create_dinners_for_user
    create_dinners_for_user_diff_weekday
    15.times do
      dinner = Dinner.find(user.dinners.pluck(:id).sample)
      menu_item = menu_item_list.sample
      menu_type = [entree, side, dish].sample
      create :order, dinner: dinner,
                     menu_item: menu_item,
                     menu_type: menu_type
    end
  end

  def create_dinners
    5.times do
      user = user_list.sample
      create :dinner, restaurant: restaurant,
                      user: user
    end
  end

  def create_orders
    create_dinners
    10.times do
      dinner = Dinner.find(Dinner.all.pluck(:id).sample)
      menu_item = menu_item_list.sample
      menu_type = [entree, side, dish].sample
      create :order, dinner: dinner,
                     menu_item: menu_item,
                     menu_type: menu_type
    end
  end

  def create_sample_data
    create_orders_for_user
    create_orders
  end

  describe 'user_prediction' do
    it 'returns weekdays as a key of hash' do
      create_sample_data
      response = PredictionEngine.new.user_prediction(user)
      expect(response.keys).to include WEEKDAYS[2.days.ago.wday]
      expect(response.keys).to include WEEKDAYS[Date.today.wday]
    end

    it 'values of hash are hashes' do
      create_sample_data
      response = PredictionEngine.new.user_prediction(user)
      expect(response.values.any?(Hash)).to be true
    end

    it 'returns count of menu_item' do
      order_1
      response = PredictionEngine.new.user_prediction(user_1)
      count = response.dig(WEEKDAYS[1.day.ago.wday], dish.name, menu_item.name)
      expect(count).to be 1
    end
  end

  describe 'dinner_prediction' do
    it 'returns weekdays as a key of hash' do
      create_sample_data
      response = PredictionEngine.new.dinner_prediction
      expect(response.keys).to include WEEKDAYS[2.days.ago.wday]
      expect(response.keys).to include WEEKDAYS[Date.today.wday]
    end

    it 'values of hash are hashes' do
      create_sample_data
      response = PredictionEngine.new.dinner_prediction
      expect(response.values.any?(Hash)).to be true
    end

    it 'returns count of menu_item' do
      order_1
      order_2
      response = PredictionEngine.new.dinner_prediction
      count = response.dig(WEEKDAYS[1.day.ago.wday], dish.name, menu_item.name)
      expect(count).to be 2
    end
  end
end
