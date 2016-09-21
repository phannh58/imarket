class Api::V1::ProductsController < Api::ApplicationController
  load_resource

  def show
    render json: @product
  end

  private

  def product_params
    params.require(:product).permit :name, :price, :quantity, :product_code,
     :description, :category_id, :photo
  end
end
