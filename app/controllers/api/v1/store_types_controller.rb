class Api::V1::StoreTypesController < Api::ApplicationController
  load_resource
  before_action :load_commerce_center, only: :index

  def index
    @store_types = @commerce_center.store_types
    render json: @store_types
  end

  private
  def load_commerce_center
    @commerce_center = CommerceCenter.find_by id: params[:commerce_center_id]
  end

  def store_type_params
    params.require(:store_type).require :name, :commerce_center_id
  end
end
