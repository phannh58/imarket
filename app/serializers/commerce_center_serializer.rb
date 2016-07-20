class CommerceCenterSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :stores
  has_many :store_types
end
