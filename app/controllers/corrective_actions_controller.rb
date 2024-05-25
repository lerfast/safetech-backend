class CorrectiveActionsController < ApplicationController
    before_action :set_corrective_action, only: %i[show update destroy]
  
    def index
      @corrective_actions = CorrectiveAction.all
      render json: @corrective_actions
    end
  
    def show
      render json: @corrective_action
    end
  
    def create
      @corrective_action = CorrectiveAction.new(corrective_action_params)
      if @corrective_action.save
        render json: @corrective_action, status: :created
      else
        render json: @corrective_action.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @corrective_action.update(corrective_action_params)
        render json: @corrective_action
      else
        render json: @corrective_action.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @corrective_action.destroy
      head :no_content
    end
  
    private
  
    def set_corrective_action
      @corrective_action = CorrectiveAction.find(params[:id])
    end
  
    def corrective_action_params
      params.require(:corrective_action).permit(:action_description, :responsible_person, :start_date, :end_date, :priority, :status, :incident_id)
    end
  end
  