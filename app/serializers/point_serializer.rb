class PointSerializer < ActiveModel::Serializer
  attributes :name, :point_type, :latitude, :longtitude, :store_type_id
  has_many :matching
end
