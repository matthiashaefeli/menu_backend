# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with valid attributes' do
    menu = Menu.new(title: 'My Menu')
    expect(menu).to be_valid
  end

  it 'is not valid without a title' do
    menu = Menu.new(title: nil)
    expect(menu).to_not be_valid
  end
end
