class Api::V1::FloorsController < Api::ApplicationController
  load_resource
  before_action :load_commerce_center, only: :index
  before_action :authenticate_with_token!, only: [:create, :update]

  def index
    @floors = @commercer_center.floors
    render json: @floors
  end

  def create
    @floor = Floor.new floor_params
    if @floor.save
      render json: @floor, status: 200, location: [:api, @floor]
    else
      render json: {errors: @floor.errors}, status: 422
    end
  end

  def update
    if @floor.update_attributes floor_params
      render json: @floor, status: :ok, location: [:api, @floor]
    else
      render json: {errors: @floor.errors}, status: :unprocessable_entity
    end
  end

  def show
    render json: @floor
  end

  private
  def load_commerce_center
    @commercer_center = CommerceCenter.find_by id: params[:commerce_center_id]
  end

  def floor_params
    params.require(:floor).permit :name, :commerce_center_id
  end
end
