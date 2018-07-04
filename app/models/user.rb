class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Field validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :locale, presence: true
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :rents, dependent: :destroy

  def admin?
    false
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first || create_omniauth_user(data)
  end

  def self.create_omniauth_user(data)
    user = User.create(data)
    user.confirm
    user
  end

  def self.get_token_data(data)
    password = Devise.friendly_token[0, 20]
    {
      first_name: get_oauth_first_name(data),
      last_name: get_oauth_last_name(data),
      email: data['email'],
      password: password,
      password_confirmation: password
    }
  end

  def self.get_oauth_first_name(data)
    return data['first_name'] if data['first_name']
    if data['name'].count(' ') > 1
      names = data['name'].split(' ')
      names.pop
      names.join(' ')
    else
      data['name'].split(' ').first
    end
  end

  def self.get_oauth_last_name(data)
    return data['last_name'] if data['last_name']
    if data['name'].count(' ') > 1
      data['name'].split(' ').last
    else
      data['name'].split(' ').second
    end
  end
end
