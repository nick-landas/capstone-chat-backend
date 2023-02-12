class SquadsController < ApplicationController
    before_action :set_squad, only: [:show, :update]

    def index
      squads = Squad.includes(:fans).all
      render json: Squadserializer.new(squads).serialized_json
    end
  
    def show
      messages = if params[:datetime]
                  @squad.messages.where('created_at > ?', params[:datetime])
                 else
                  @squad.messages
                 end
      render json: MessageSerializer.new(messages).serialized_json
    end
  
    def create
      squad = Squad.new(squad_params)
      if squad.save
        render json: Squadserializer.new(squad).serialized_json
      else
        render json: { error: 'could not be created' }
      end
    end
  
    def update
      if @squad.update(squad_params)
        render json: Squadserializer.new(@squad).serialized_json
      else
        render json: { error: 'could not be updated' }
      end
    end
  
    private
  
    def set_squad
      @squad = Squad.find(params[:id])
    end
  
    def squad_params
      params.require(:squad).permit(:name, :description, :image_url, fan_ids: [])
    end
end
