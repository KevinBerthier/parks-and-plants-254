# frozen_string_literal: true

class Garden < ApplicationRecord
  has_many :plants, dependent: :destroy
end
