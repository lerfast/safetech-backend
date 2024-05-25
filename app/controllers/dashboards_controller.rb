class DashboardsController < ApplicationController
    before_action :set_dashboard, only: %i[show update destroy]
  
    def index
      @dashboards = Dashboard.all
      render json: @dashboards
    end
  
    def show
      render json: @dashboard
    end
  
    def create
      @dashboard = Dashboard.new(dashboard_params)
      if @dashboard.save
        render json: @dashboard, status: :created
      else
        render json: @dashboard.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @dashboard.update(dashboard_params)
        render json: @dashboard
      else
        render json: @dashboard.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @dashboard.destroy
      head :no_content
    end
  
    private
  
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end
  
    def dashboard_params
      params.require(:dashboard).permit(:title, :description, :data, :user_id)
    end
  end
  