class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :product_code, :sale_off
end
