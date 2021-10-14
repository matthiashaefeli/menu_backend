# frozen_string_literal: true

class User < ApplicationRecord
  has_many :dinners

  validates :name, presence: true
end
