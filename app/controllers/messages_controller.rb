class MessagesController < ApplicationController
    def index
        fan = Fan.find(params[:fan_id])
        squad_ids = Fan.memberships.pluck(:squad_id)
        messages = Message.where(squad_id: squad_ids)
        render json: MessageSerializer.new(messages).serialized_json
      end
end
