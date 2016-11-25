class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :store_id
  has_many :products

  def image
    object.image.url
  end
end
