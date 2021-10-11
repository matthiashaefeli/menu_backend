# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { create :restaurant }
  it 'is valid with valid attributes' do
    expect(restaurant).to be_valid
  end

  it 'is not valid without a title' do
    restaurant.name = nil
    expect(restaurant).to_not be_valid
  end
end
