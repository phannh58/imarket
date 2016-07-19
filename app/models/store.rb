class Store < ActiveRecord::Base
  belongs_to :store_type
  belongs_to :commerce_center
end
