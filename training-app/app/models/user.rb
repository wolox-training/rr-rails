# frozen_string_literal: true

class User < ApplicationRecord
  
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable

end
