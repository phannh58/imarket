class Product < ActiveRecord::Base
  belongs_to :category
  mount_base64_uploader :photo, PhotoUploader
end
