class MessageTransferJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      squad = message.squad
      MessagesChannel.broadcast_to(squad, MessageSerializer.new(message).serialized_json)
    end
  end