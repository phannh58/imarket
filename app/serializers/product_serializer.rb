class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :description, :promotion_percent
  has_many :image_products
end
