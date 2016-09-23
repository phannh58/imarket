class Api::V1::ProductsController < Api::ApplicationController
  load_resource
  before_action :load_category, only: :index

  def show
    render json: @product
  end

  def index
    @products = @category.products
    render json: @products
  end

  private
  def load_category
    @category = Category.find_by id: params[:category_id]
  end

  def product_params
    params.require(:product).permit :name, :price, :quantity, :product_code,
     :description, :category_id, :photo
  end
end
