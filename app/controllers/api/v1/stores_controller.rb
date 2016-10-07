class Api::V1::StoresController < Api::ApplicationController
  load_resource
  before_action :load_floor, only: :index
  before_action :authenticate_with_token!, only: [:create, :update]
  respond_to :json

  def index
    if params[:store_type_id].present?
      @stores = @floor.stores.filter_by_store_type params[:store_type_id]
    else
      @stores = @floor.stores
    end
    render json: @stores
  end

  def create
    @store = Store.new store_params
    if @store.save
      render json: @store, status: 200, location: [:api, @store]
    else
      render json: {errors: @store.errors}, status: 420
    end
  end

  def update
    if @store.update_attributes store_params
      render json: @store, status: :ok, location: [:api, @store]
    else
      render json: {errors: @store.errors}, status: :unprocessable_entity
    end
  end

  def show
    respond_with Store.find params[:id]
  end

  private
  def load_floor
    @floor = Floor.find_by id: params[:floor_id]
  end

  def store_params
    params[:store][:image] = set_param_image_base_64 params[:store][:image]
    params.require(:store).permit :name, :image, :floor_id, :store_type
  end
end
