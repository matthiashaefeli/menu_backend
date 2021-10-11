# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let(:menu_item) { create :menu_item }
  let(:menu_item_1) { create :menu_item }

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

  it 'name must be uniq' do
    menu_item_1.name = menu_item.name
    expect(menu_item_1).to_not be_valid
  end

  describe 'has_many' do
    let(:menu_item) { create :menu_item }
    let!(:menu_menu_item) { create :menu_menu_item, :with_menu, menu_item: menu_item }
    let!(:menu_menu_item_1) { create :menu_menu_item, :with_menu, menu_item: menu_item }

    it 'has many menus' do
      expect(menu_item.menus.length).to eq 2
    end
  end
end
