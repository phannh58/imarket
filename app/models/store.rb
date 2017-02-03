class Store < ActiveRecord::Base
  belongs_to :store_type
  belongs_to :floor
  has_many :categories, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  mount_base64_uploader :image, PhotoUploader

  scope :filter_by_store_type, ->store_type_id{where store_type_id: store_type_id}

end
