class CommerceCenter < ActiveRecord::Base
  belongs_to :district
  has_many :store_types
  has_many :stores
end
