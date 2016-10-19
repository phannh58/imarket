class Point < ActiveRecord::Base
  belongs_to :store_type
  has_many :active_edges, class_name: Edge.name, foreign_key :point_start_id,
    dependent: :destroy
  has_many :passive_edges, class_name: Edge.name, foreign_key :point_end_id,
    dependent: :destroy
  has_many :matching, through: :active_edges, source: :point_end
  has_many :matchers, through: :passive_edges, source: :point_start
  validates :name, presence: true, uniqueness: true
end
