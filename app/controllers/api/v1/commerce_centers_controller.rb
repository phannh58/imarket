class Api::V1::CommerceCentersController < Api::ApplicationController
  load_resource

  def index
    if params[:search]
      @commerce_centerses = CommerceCenter.search(params[:search])
        .order("created_at DESC")
      render json: @commerce_centerses
    else
      @commerce_centerses = CommerceCenter.all.order("created_at DESC")
      render json: @commerce_centerses
    end
  end

  def create

  end

  def show
    render json: @commerce_center
  end

  private
  def commerce_center_params
    params.require(:commerce_center).permit :name, :image
  end
end
