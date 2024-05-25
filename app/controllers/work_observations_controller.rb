class WorkObservationsController < ApplicationController
    before_action :set_work_observation, only: %i[show update destroy]
  
    def index
      @work_observations = WorkObservation.all
      render json: @work_observations
    end
  
    def show
      render json: @work_observation
    end
  
    def create
      @work_observation = WorkObservation.new(work_observation_params)
      if @work_observation.save
        render json: @work_observation, status: :created
      else
        render json: @work_observation.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @work_observation.update(work_observation_params)
        render json: @work_observation
      else
        render json: @work_observation.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @work_observation.destroy
      head :no_content
    end
  
    private
  
    def set_work_observation
      @work_observation = WorkObservation.find(params[:id])
    end
  
    def work_observation_params
      params.require(:work_observation).permit(:description, :observed_at, :user_id)
    end
  end
  