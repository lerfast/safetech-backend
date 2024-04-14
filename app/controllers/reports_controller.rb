class ReportsController < ApplicationController
    before_action :set_report, only: [:show, :update, :destroy]
  
    def index
      @reports = Report.all
      render json: @reports
    end
  
    def show
      render json: @report
    end
  
    def create
      @report = Report.new(report_params)
      if @report.save
        render json: @report, status: :created, location: @report
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @report.update(report_params)
        render json: @report
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @report.destroy
      head :no_content
    end
  
    private
      def set_report
        @report = Report.find(params[:id])
      end
  
      def report_params
        params.require(:report).permit(:incident_id, :details)
      end
  end
  