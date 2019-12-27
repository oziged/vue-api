class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, :registerable, :confirmable
      # :recoverable, :rememberable, 

  validates :login, presence: true

  has_many :plans
      class << self
        def authenticate(email, password)
          user = User.find_for_authentication(email: email)
          user.try(:valid_password?, password) ? user : nil
        end
      end
end
