class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :store_id

  def image
    object.image.url
  end
end
