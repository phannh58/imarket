class CommerceCenterSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :address, :latitude, :longtitude

  def image
    object.image.url
  end
end
