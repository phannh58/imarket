class Floor < ActiveRecord::Base
  belongs_to :commerce_center
  has_many :stores
end
