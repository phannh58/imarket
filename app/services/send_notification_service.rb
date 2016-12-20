class SendNotificationService

  def initialize event
    @event = event
  end

  def perfom
    fcm = FCM.new(ENV["firebase_api_key"])
    reg_ids = User.all.map {|user| user.auth_token}
    options = {
      data:
       {
          content: @event.content,
          start_event: @event.start_event,
          finish_event: @event.finish_event,
          store_id: @event.store_id
        }
      }
    response = fcm.send(reg_ids, options)
  end
end
