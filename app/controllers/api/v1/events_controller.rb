class Api::V1::EventsController < Api::ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update]
  load_resource
  before_action :load_store, only: [:index, :create, :update]

  def index
    @events = @store.events
    render json: @events
  end

  def show
    render json: @event
  end

  def create
    @event = Event.create event_params
    if @event.save
      SendNotificationService.new(@event).perfom()
      render json: @event, status: 200, location: [:api, @store, @event]
    else
      render json: {errors: @event.errors}, status: 420
    end
  end

  def update
    if @event.update_attributes event_params
      SendNotificationService.new(@event).perfom()
      render json: @event, status: 200, location: [:api, @store, @event]
    else
      render json: {errors: @event.errors}, status: 420
    end
  end

  private
  def load_store
    @store = Store.find_by id: params[:store_id]
  end

  def event_params
    params.require(:event).permit :name, :content, :event_type, :start_event, :finish_event,
      :store_id
  end
end
