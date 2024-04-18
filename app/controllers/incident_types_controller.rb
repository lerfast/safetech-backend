class IncidentTypesController < ApplicationController
    before_action :authorize_request
    
    def index
      @incident_types = IncidentType.all
      render json: @incident_types
    end
  
    def show
      render json: @incident_type
    end
  
    def create
      @incident_type = IncidentType.new(incident_type_params)
      if @incident_type.save
        render json: @incident_type, status: :created, location: @incident_type
      else
        render json: @incident_type.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @incident_type.update(incident_type_params)
        render json: @incident_type
      else
        render json: @incident_type.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @incident_type.destroy
      head :no_content
    end
  
    private
      def set_incident_type
        @incident_type = IncidentType.find(params[:id])
      end
  
      def incident_type_params
        params.require(:incident_type).permit(:type_name, :description)
      end
  end
  