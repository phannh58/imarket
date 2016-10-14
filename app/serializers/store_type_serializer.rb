class StoreTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image

  def image
    object.image.url
  end
end
