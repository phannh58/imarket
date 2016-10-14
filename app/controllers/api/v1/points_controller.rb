class Api::V1::PointsController < Api::ApplicationController
  load_resource
  before_action :authenticate_with_token!, only: [:create, :update]

  def index
    @points = Point.all
    render json: @points
  end

  def show
    render json: @point
  end

  def create
    @point = Point.create point_params
    if @point.save
      render json: @point, status: 200, location: [:api, @point]
    else
      render json: {errors: @point.errors}, status: 420
    end
  end

  def update
    if @point.update_attributes point_params
      render json: @point, status: 200, location: [:api, @point]
    else
      render json: {errors: @point.errors}, status: 420
    end
  end

  private
  def point_params
    params.require(:point).permit :type, :latitude, :longtitude, :name, :store_type_id
  end
end
