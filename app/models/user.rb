class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Field validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :locale, presence: true
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  has_many :rents, dependent: :destroy

  def admin?
    false
  end
end
