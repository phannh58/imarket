class CommerceCenter < ActiveRecord::Base
  belongs_to :district
  has_many :store_types
  has_many :stores

  scope :search, ->search {where("name LIKE ?",
    "%#{search}%")}
end
