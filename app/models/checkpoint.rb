class Checkpoint < ApplicationRecord
  include NestedHandler

  belongs_to :user
  belongs_to :checkpointable, polymorphic: true
  has_many :checkpoints, as: :checkpointable

  validates :title, presence: true
  validates :description, presence: true
end
