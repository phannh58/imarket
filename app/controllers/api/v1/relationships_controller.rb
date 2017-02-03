class Api::V1::RelationshipsController < Api::ApplicationController
  before_action :authenticate_with_token!

  def create
    store = Store.find_by id: params[:relationship][:followed_id]
    if current_user.follow store
      render json: {"message": t("api.v1.follow.create.success")}
    else
      render json: {"message": t("api.v1.follow.create.fail")}
    end
  end

  def destroy
    store = Relationship.find(params[:id]).followed
    if current_user.unfollow store
      render json: store
    else
      render json: {"message": t("api.v1.follow.destroy.fail")}
    end
  end

  def index
    stores = current_user.following
    render json: stores
  end
end
