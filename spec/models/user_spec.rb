# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a title' do
    user.name = nil
    expect(user).to_not be_valid
  end
end
