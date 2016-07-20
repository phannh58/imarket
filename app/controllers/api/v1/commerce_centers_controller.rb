class Api::V1::CommerceCentersController < ApplicationController
  load_resource

  def show
    render json: @commerce_center
  end
end
