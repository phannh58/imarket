class Api::V1::EventsController < Api::ApplicationController
  before_action :load_store, only: :index

  def index
    @events = @store.events
    render json: @events
  end

  private
  def load_store
    @store = Store.find_by id: params[:store_id]
  end
end
