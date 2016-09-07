class Api::V1::CategoriesController < Api::ApplicationController
  before_action :load_store, only: :index
  before_action :load_category, only: :show

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

  def load_category
    @category = Category.find_by id: params[:id]
  end
end
