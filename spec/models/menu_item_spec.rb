# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let!(:menu_item) { create :menu_item, :with_menu }
  let!(:menu_item_1) { create :menu_item, menu: menu_item.menu }
  let!(:menu_item_2) { create :menu_item, :with_menu }

  it 'is valid with valid attributes' do
    expect(menu_item).to be_valid
  end

  it 'is not valid without a name' do
    menu_item.name = nil
    expect(menu_item).to_not be_valid
  end

  it 'is not valid without a description' do
    menu_item.description = nil
    expect(menu_item).to_not be_valid
  end

  it 'is not valid without a price' do
    menu_item.price = nil
    expect(menu_item).to_not be_valid
  end

  it 'is not valid without a menu_id' do
    menu_item.menu_id = nil
    expect(menu_item).to_not be_valid
  end

  it 'name must be uniq within a menu scope' do
    menu_item_1.name = menu_item.name
    expect(menu_item_1).to_not be_valid
  end

  it 'name must not be uniq within a different menu scope' do
    menu_item_2.name = menu_item.name
    expect(menu_item_2).to be_valid
  end
end
