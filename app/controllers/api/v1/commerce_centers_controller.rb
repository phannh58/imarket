class Api::V1::CommerceCentersController < Api::ApplicationController
  load_resource

  def show
    render json: @commerce_center
  end
end
