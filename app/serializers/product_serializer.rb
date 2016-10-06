class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :product_code, :sale_off
  has_many :image_products
end
