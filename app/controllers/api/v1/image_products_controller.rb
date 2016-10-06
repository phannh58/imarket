class Api::V1::ImageProductsController < Api::ApplicationController
  load_resource
  before_action :load_products, only: :index

  def show
    render json: @image_product
  end

  def index
    @image_products = @product.image_products
    render json: @image_products
  end

  private
  def load_products
    @product = Product.find_by id: params[:product_id]
  end
end
