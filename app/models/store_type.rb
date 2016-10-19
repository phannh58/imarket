class StoreType < ActiveRecord::Base
  belongs_to :commerce_center
  has_many :stores
  has_many :points
  validates :name, presence: true, uniqueness: true
  mount_base64_uploader :image, PhotoUploader
end

