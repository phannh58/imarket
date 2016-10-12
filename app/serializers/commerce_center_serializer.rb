class CommerceCenterSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :address

  def image
    object.image.url
  end
end
