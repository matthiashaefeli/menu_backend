# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenuMenuItem, type: :model do
  let(:menu_item) { create :menu_item }
  let(:menu) { create :menu, :with_restaurant }

  it 'is valid with valid attributes' do
    menu_menu_item = MenuMenuItem.new(menu: menu, menu_item: menu_item)
    expect(menu_menu_item).to be_valid
  end

  it 'is not valid without a menu' do
    menu_menu_item = MenuMenuItem.new(menu: nil, menu_item: menu_item)
    expect(menu_menu_item).to_not be_valid
  end

  it 'is not valid without a menu' do
    menu_menu_item = MenuMenuItem.new(menu: menu, menu_item: nil)
    expect(menu_menu_item).to_not be_valid
  end
end
