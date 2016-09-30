class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :avatar, :birth_day, :phone_number, :auth_token,

  def avatar
    object.avatar.url
  end
end
