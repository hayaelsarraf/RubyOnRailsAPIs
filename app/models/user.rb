class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # JWT helper
  def generate_jwt
    JWT.encode(
      { id: id, exp: 24.hours.from_now.to_i },
      Rails.application.credentials.devise_jwt_secret_key
    )
  end
end
