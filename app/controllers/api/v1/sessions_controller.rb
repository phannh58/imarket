class Api::V1::SessionsController < Api::ApplicationController

  def create
    user = User.find_by email: params[:session][:email].try(:downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user, store: false
      user.save
      render json: user, status: :ok
    else
      render json: {errors: t(".error_login")}, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by id: params[:id]
    if user && user.auth_token == request.headers["Authorization"]
      user.generate_authentication_token!
      user.save
      head :no_content
    else
      render json: {errors: t(".error_logout")}, status: :unprocessable_entity
    end
  end
end
