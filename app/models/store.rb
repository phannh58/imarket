class Store < ActiveRecord::Base
  belongs_to :store_type
  belongs_to :commerce_center
  has_many :categories
end
