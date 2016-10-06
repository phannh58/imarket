class Api::V1::ProductsController < Api::ApplicationController
  load_resource
  before_action :load_category, only: [:index, :create, :update]
  before_action :authenticate_with_token!, only: [:create, :update]

  def show
    render json: @product
  end

  def index
    @products = @category.products
    render json: @products
  end

  def create
    @product = Product.new product_params
    if @product.save
      render json: @product, status: 200, location: [:api, @category, @product]
    else
      render json: {errors: @product.errors}, status: 420
    end
  end

  def update
    if @product.update_attributes product_params
      render json: @product, status: :ok, location: [:api, @category, @product]
    else
      render json: {errors: @product.errors}, status: :unprocessable_entity
    end
  end

  private
  def load_category
    @category = Category.find_by id: params[:category_id]
  end

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description,
      :category_id, image_products_attributes: [:id, :name, :product_id, :image])
  end
end
