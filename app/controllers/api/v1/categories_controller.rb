class Api::V1::CategoriesController < Api::ApplicationController
  load_resource
  before_action :load_store, only: :index

  def index
    @categories = @store.categories
    render json: @categories
  end

  def show
    @products = @category.products
    render json: @products
  end

  private
  def load_store
    @store = Store.find_by id: params[:store_id]
  end

  def param_category
    params.require(:category).permit :name, :image
  end
end
