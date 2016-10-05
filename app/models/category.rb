class Category < ActiveRecord::Base
  belongs_to :store
  has_many :products, dependent: :destroy
  mount_base64_uploader :image, PhotoUploader
end
