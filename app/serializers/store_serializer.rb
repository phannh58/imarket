class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_code, :image

  def image
    object.image.url
  end
end
