class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :description, :promotion_percent

  def photos
    photos.each do |photo|
      object.photo.url
    end
  end
end
