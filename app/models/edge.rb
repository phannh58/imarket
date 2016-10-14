class Edge < ActiveRecord::Base
  belongs_to :point_start, class_name: Point.name
  belongs_to :point_end, class_name: Point.name
  validates :point_start_id, presence: true
  validates :point_end_id, presence: true
end
