class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  before_create :generate_authentication_token!

  validates :auth_token, uniqueness: true
  validates :full_name, presence: true, length: {maximum: 50}
  validates :phone_number, length: {minimum: 10, maximum: 11}
  mount_base64_uploader :avatar, PhotoUploader

  ATTRIBUTES_PARAMS = [:full_name, :email, :password, :password_confirmation,
    :avatar, :phone_number]

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists? auth_token: auth_token
  end

  class << self
    def authenticate_user_from_facebook access_token
      user = User.new
      graph = Koala::Facebook::API.new access_token
      begin
        profile = graph.get_object Settings.facebook_field
        uhash = Hash.new
        uhash[:provider] = Settings.facebook_provider
        uhash[:info] = Hash.new
        uhash[:info][:uid] = profile["id"]
        uhash[:info][:full_name] = profile["name"]
        uhash[:info][:email] = profile["email"]
        uhash[:info][:avatar] = profile["picture"]["data"]["url"]
        user = User.apply_auth uhash
      rescue Koala::Facebook::AuthenticationError
        user.errors.add :message, I18n.t("application.api.wrong_access_token")
      end

      return user
    end

    def authenticate_user_from_google access_token
      user = User.new
      response = HTTParty.get(Settings.user_url,
        headers: {"Authorization" => "OAuth #{access_token}"})
      if response["error"].nil?
        uhash = Hash.new
        uhash[:provider] = Settings.google_provider
        uhash[:info] = Hash.new
        uhash[:info][:uid] = response["id"]
        uhash[:info][:full_name] = response["name"]
        uhash[:info][:email] = response["email"]
        uhash[:info][:avatar] = response["picture"]
        user = User.apply_auth uhash
      else
        user.errors.add :message, I18n.t("application.api.wrong_access_token")
      end
      return user
    end
  end

  private
  class << self
    def apply_auth uhash
      User.where(uid: uhash[:info][:uid], provider: uhash[:provider])
        .first_or_create do |user|
        user.full_name = uhash[:info][:full_name]
        user.password = Devise.friendly_token[0, 20]
        user.email = uhash[:info][:email]
        user.avatar = uhash[:info][:avatar]
      end
    end
  end
end
