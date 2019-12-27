class Plan < ApplicationRecord
  belongs_to :user
  has_many :checkpoints

  def self.test
    where("id > 50")
  end
end
