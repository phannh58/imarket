class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :start_event, :finish_event
  has_one :store
end
