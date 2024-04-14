class IncidentsController < ApplicationController
    before_action :set_incident, only: [:show, :update, :destroy]
  
    def index
      @incidents = Incident.all
      render json: @incidents
    end
  
    def show
      render json: @incident
    end
  
    def create
      @incident = Incident.new(incident_params)
      if @incident.save
        render json: @incident, status: :created, location: @incident
      else
        render json: @incident.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @incident.update(incident_params)
        render json: @incident
      else
        render json: @incident.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @incident.destroy
      head :no_content
    end
  
    private
      def set_incident
        @incident = Incident.find(params[:id])
      end
  
      def incident_params
        params.require(:incident).permit(:date, :description, :severity, :incident_type_id, :user_id)
      end
  end
  