class ActionsController < ApplicationController
    before_action :authorize_request
  
    def index
      @actions = Action.all
      render json: @actions
    end
  
    def show
      render json: @action
    end
  
    def create
      @action = Action.new(action_params)
      if @action.save
        render json: @action, status: :created, location: @action
      else
        render json: @action.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @action.update(action_params)
        render json: @action
      else
        render json: @action.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @action.destroy
      head :no_content
    end
  
    private
      def set_action
        @action = Action.find(params[:id])
      end
  
      def action_params
        params.require(:action).permit(:incident_id, :action_taken, :date_action_taken)
      end
  end
  