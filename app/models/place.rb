class Place < ApplicationRecord
  has_many :checkpoints

  validates :lat, numericality: true
  validates :lng, numericality: true
end
