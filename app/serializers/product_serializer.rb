class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :product_code, :sale_off, :photo
  has_one :category
end
