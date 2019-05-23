# frozen_string_literal: true

class Plant < ApplicationRecord
  belongs_to :garden
  has_many :plant_tags, dependent: :destroy
  has_many :tags, through: :plant_tags

  validates :name, presence: true
  validates :image_url, presence: true
end
