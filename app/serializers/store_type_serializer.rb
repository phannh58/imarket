class StoreTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :commerce_center_id

  def image
    object.image.url
  end
end
