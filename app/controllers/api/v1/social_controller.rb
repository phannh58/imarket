class Api::V1::SocialController < Api::ApplicationController
  def facebook
    user = User.authenticate_user_from_facebook request
      .headers[Settings.ACCESS_TOKEN]
    if user.errors.messages.empty?
      user.generate_authentication_token!
      render json: user, status: :ok
    else
      render json: {errors: user.errors.messages[:message]},
        status: :unprocessable_entity
    end
  end
end
