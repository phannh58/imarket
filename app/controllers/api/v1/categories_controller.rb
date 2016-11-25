class Api::V1::CategoriesController < Api::ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update]
  load_resource
  before_action :load_store, only: :index

  def index
    @categories = @store.categories
    render json: @categories
  end

  def create
    @category = Category.new category_params
    if @category.save
      render json: @category, status: 200, location: [:api, @category]
    else
      render json: {errors: @category.errors}, status: 420
    end
  end

  def show
    render json: @category
  end

  def update
    if @category.update_attributes category_params
      render json: @category, status: :ok, location: [:api, @category]
    else
      render json: {errors: @category.errors}, status: :unprocessable_entity
    end
  end

  private
  def load_store
    @store = Store.find_by id: params[:store_id]
  end

  def category_params
    params[:category][:image] = set_param_image_base_64 params[:category][:image]
    params.require(:category).permit :name, :image, :store_id
  end
end
