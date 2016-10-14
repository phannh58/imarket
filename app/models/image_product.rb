class ImageProduct < ActiveRecord::Base
  belongs_to :product
  mount_base64_uploader :photo, PhotoUploader
end
