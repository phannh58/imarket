class CommerceCenter < ActiveRecord::Base
  belongs_to :district
  has_many :store_types
  has_many :floors
  mount_base64_uploader :image, PhotoUploader

  scope :search, ->search {where("name LIKE ?",
    "%#{search}%")}
end
