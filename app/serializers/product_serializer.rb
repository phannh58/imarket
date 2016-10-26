class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :description, :category_id, :promotion_percent
  has_many :image_products
end
