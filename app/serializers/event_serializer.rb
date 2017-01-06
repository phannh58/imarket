class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :event_type,
    :start_event, :finish_event, :store_id

  def start_event
    object.start_event.strftime(I18n.t('events.format.time'))
  end

  def finish_event
    object.finish_event.strftime(I18n.t('events.format.time'))
  end
end
