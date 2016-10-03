class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image
  has_one :store

  def image
    object.image.url
  end
end
