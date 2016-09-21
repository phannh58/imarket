class Api::V1::StoresController < Api::ApplicationController
  respond_to :json

  def index
    if params[:store_type_id].present?
      @stores = Store.filter_by_store_type params[:store_type_id]
    else
      @stores = Store.all
    end
    render json: @stores
  end

  def show
    respond_with Store.find params[:id]
  end

  def store_param
    params.require(:store).permit :name, :image, :commerce_center_id, :store_code,
      :store_type
  end
end
