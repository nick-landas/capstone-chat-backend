class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_for Squad.find_by(id: params['id'])
  end

  def receive(data)
    team = Squad.find_by(id: data['squadId'])
    user = Fan.find_by(id: data['fanId'])
    message = squad.messages.create(content: data['content'], fan: fan)
    MessageRelayJob.perform_later(message)
  end

  def unsubscribed
    stop_all_streams
  end
end
