# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) { create :menu, :with_restaurant}
  it 'is valid with valid attributes' do
    expect(menu).to be_valid
  end

  it 'is not valid without a title' do
    menu.title = nil
    expect(menu).to_not be_valid
  end

  it 'is not valid without a restaurant' do
    menu.restaurant = nil
    expect(menu).to_not be_valid
  end
end
