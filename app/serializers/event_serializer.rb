class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :event_type,
    :start_event, :finish_event, :store_id
end
