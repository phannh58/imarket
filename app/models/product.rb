class Product < ActiveRecord::Base
  belongs_to :category
  has_many :image_products, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :image_products
end
