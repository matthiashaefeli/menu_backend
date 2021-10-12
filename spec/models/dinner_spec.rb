# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dinner, type: :model do
  let(:dinner) { create :dinner, :with_restaurant }
  it 'is valid with valid attributes' do
    expect(dinner).to be_valid
  end

  it 'is not valid without a restaurant' do
    dinner.restaurant = nil
    expect(dinner).to_not be_valid
  end

  describe 'complete salad dinner' do
    let(:dinner) { create :dinner, :with_restaurant }
    let(:entree) { create :menu_type, name: 'Entree' }
    let(:side) { create :menu_type, name: 'Side' }
    let(:dish) { create :menu_type, name: 'Standalone Dish' }
    let(:dressing) { create :menu_type, name: 'Dressing' }
    let(:salad) { create :menu_item, name: 'Salad' }
    let(:honey_mustard) { create :menu_item, name: 'Honey Mustard' }
    let(:ranch) { create :menu_item, name: 'Ranch' }
    let!(:order_1) { create :order, dinner: dinner, menu_type: entree, menu_item: salad }
    let!(:order_2) { create :order, dinner: dinner, menu_type: dressing, menu_item: honey_mustard }
    let!(:order_3) { create :order, dinner: dinner, menu_type: dressing, menu_item: ranch }
    let!(:order_4) { create :order, dinner: dinner, menu_type: side, menu_item: salad }
    let!(:order_5) { create :order, dinner: dinner, menu_type: dish, menu_item: salad }

    it 'can order a salad as an Entree' do
      expect(dinner.complete_order['Entree']).to include 'Salad'
      expect(dinner.complete_order['Dressing']).to include 'Ranch'
      expect(dinner.complete_order['Dressing']).to include 'Honey Mustard'
    end

    it 'can order a salad as an standalone dish' do
      expect(dinner.complete_order['Standalone Dish']).to include 'Salad'
    end

    it 'can order a salad as a side' do
      expect(dinner.complete_order['Side']).to include 'Salad'
    end
  end
end
