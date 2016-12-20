class Api::V1::StoreTypesController < Api::ApplicationController
  load_resource
  before_action :load_commerce_center, only: [:index, :create, :update]
  before_action :authenticate_with_token!, only: [:create, :update]

  def show
    render json: @store_type
  end

  def index
    @store_types = @commerce_center.store_types
    render json: @store_types
  end

  def create
    @store_type = StoreType.new store_type_params
    if @store_type.save
      render json: @store_type, status: 200, location: [:api, @commerce_center, @store_type]
    else
      render json: {errors: @store_type.errors}, status: 420
    end
  end

  def update
    if @store_type.update_attributes store_type_params
      render json: @store_type, status: :ok, location: [:api, @commerce_center, @store_type]
    else
      render json: {errors: @store_type.errors}, status: :unprocessable_entity
    end
  end

  private
  def load_commerce_center
    @commerce_center = CommerceCenter.find_by id: params[:commerce_center_id]
  end

  def store_type_params
    params[:store_type][:image] = set_param_xml_base_64 params[:store_type][:image]
    params[:store_type][:current_location_image] =
      set_param_xml_base_64 params[:store_type][:current_location_image]
    params.require(:store_type).permit :name, :image, :current_location_image,
      :commerce_center_id
  end
end
