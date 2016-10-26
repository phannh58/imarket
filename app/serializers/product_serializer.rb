class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :category_id, :description, :promotion_percent
  has_many :image_products
end
