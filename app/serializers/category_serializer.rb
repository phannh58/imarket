class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :store_id
  has_many :product

  def image
    object.image.url
  end
end
