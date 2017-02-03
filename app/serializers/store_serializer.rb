class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :image
  has_many :followers

  def image
    object.image.url
  end
end
