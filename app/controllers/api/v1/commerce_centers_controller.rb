class Api::V1::CommerceCentersController < Api::ApplicationController
  load_resource
  before_action :authenticate_with_token!, only: [:create, :update]

  def index
    if params[:search]
      @commerce_centerses = CommerceCenter.search(params[:search])
        .order("created_at DESC")
      render json: @commerce_centerses
    else
      @commerce_centerses = CommerceCenter.all.order("created_at DESC")
      render json: @commerce_centerses
    end
  end

  def create
    @commerce_center = CommerceCenter.new commerce_center_params
    if @commerce_center.save
      render json: @commerce_center, status: 200, location: [:api, @commerce_center]
    else
      render json: {errors: @commerce_center.errors}, status: 422
    end
  end

  def update
    if @commerce_center.update_attributes commerce_center_params
      render json: @commerce_center, status: :ok, location: [:api, @commerce_center]
    else
      render json: {errors: @commerce_center.errors}, status: :unprocessable_entity
    end
  end

  def show
    render json: @commerce_center
  end

  private
  def commerce_center_params
    params[:commerce_center][:image] = set_param_image_base_64 params[:commerce_center][:image]
    params.require(:commerce_center).permit :name, :image, :address
  end
end
