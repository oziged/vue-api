class Checkpoint < ApplicationRecord
  belongs_to :plan
  has_many :places
end
