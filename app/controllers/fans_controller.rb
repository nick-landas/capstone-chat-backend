class FansController < ApplicationController
    def index
        fans = Fan.includes(:squads).all
        render json: FanSerializer.new(fans).serialized_json
      end
    
      def update
        fan = Fan.find(params[:id])
        membership = Fan.memberships.find_by(squad_id: params[:squad_id])
        membership.update(last_viewed: params[:last_viewed])
        render json: AllianceSerializer.new(alliance, include: [:squad]).serialized_json
      end
    
      def create
        fan = Fan.new(fan_params)
        if fan.save
          render json: FanSerializer.new(fan).serialized_json
        else
          render json: { error: 'error creating fan' }
        end
      end
    
      private
    
      def fan_params
        params.require(:fan).permit(:email, :name, :image_url)
      end

end
