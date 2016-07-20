class Store < ActiveRecord::Base
  belongs_to :store_type
  belongs_to :commerce_center
  has_many :categories

  scope :filter_by_store_type, ->store_type_id{where store_type_id: store_type_id}
end
