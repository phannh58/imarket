class StoreTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :current_location_image, :commerce_center_id

  def image
    object.image.url
  end

  def current_location_image
    object.current_location_image.url
  end
end
