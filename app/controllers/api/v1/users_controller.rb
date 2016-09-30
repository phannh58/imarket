class Api::V1::UsersController < Api::ApplicationController
  load_resource
  respond_to :json
  before_action :authenticate_with_token!, only: [:update, :destroy, :show]

  def show
    respond_with User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: @user, status: :created, location: [:api, @user]
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes user_params
      render json: @user, status: :ok, location: [:api, @user]
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params[:user][:avatar] = set_param_image_base_64 params[:user][:avatar]
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end
end
