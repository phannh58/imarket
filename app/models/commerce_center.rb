class CommerceCenter < ActiveRecord::Base
  belongs_to :district
  has_many :store_types
  mount_base64_uploader :image, PhotoUploader
  has_many :floors

  scope :search, ->search {where("name LIKE ?",
    "%#{search}%")}
end
