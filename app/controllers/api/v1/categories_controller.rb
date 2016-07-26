class Api::V1::CategoriesController < Api::ApplicationController
  before_action :load_store, only: :index

  def index
    @categories = @store.categories
    render json: @categories
  end

  private
  def load_store
    @store = Store.find_by id: params[:store_id]
  end
end
