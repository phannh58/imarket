class ImageProduct < ActiveRecord::Base
  belongs_to :product
  # mount_base64_uploader :image, PhotoUploader
end
