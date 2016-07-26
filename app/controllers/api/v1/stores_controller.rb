class Api::V1::StoresController < ApplicationController
  def index
    @stores = Store.filter_by_store_type params[:store_type_id]
    render json: @stores
  end
end
