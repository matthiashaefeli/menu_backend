# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create :order }
  it 'is valid with valid attributes' do
    expect(order).to be_valid
  end

  it 'is not valid without a dinner' do
    order.dinner = nil
    expect(order).to_not be_valid
  end

  it 'is not valid without a menu_item' do
    order.menu_item = nil
    expect(order).to_not be_valid
  end

  it 'is not valid without a menu_type' do
    order.menu_type = nil
    expect(order).to_not be_valid
  end
end
