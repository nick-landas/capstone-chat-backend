class AlliancesController < ApplicationController
    def index
      fan = Fans.find(params[:fan_id])
      alliances = fan.alliances
      render json: AllianceSerializer.new(alliances, include: [:squad]).serialized_json
    end
  
    def show
      alliance = Alliance.find(params[:id])
      render json: AllianceSerializer.new(alliance, include: [:squad]).serialized_json
    end
  end