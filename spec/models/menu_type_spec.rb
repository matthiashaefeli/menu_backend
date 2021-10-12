# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenuType, type: :model do
  let(:menu_type) { create :menu_type }
  it 'is valid with valid attributes' do
    expect(menu_type).to be_valid
  end

  it 'is not valid without a title' do
    menu_type.name = nil
    expect(menu_type).to_not be_valid
  end
end
