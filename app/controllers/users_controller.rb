class UsersController < ApplicationController
  load_and_authorize_resource

  private
  def users_params
    params.require(:user).permit :full_name, :email, :password,
      :password_confirmation, :avatar, :phone_number
  end
end
