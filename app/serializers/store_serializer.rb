class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_code, :image
  has_one :commerce_center

  def image
    object.image.url
  end
end
