class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {email.downcase!}
  before_create :generate_authentication_token!

  validates :auth_token, uniqueness: true
  validates :full_name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  ATTRIBUTES_PARAMS = [:full_name, :email, :password, :password_confirmation,
    :avatar]
  has_secure_password

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists? auth_token: auth_token
  end
end
