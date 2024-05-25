class InspectionsController < ApplicationController
    before_action :set_inspection, only: %i[show update destroy]
  
    def index
      @inspections = Inspection.all
      render json: @inspections
    end
  
    def show
      render json: @inspection
    end
  
    def create
      @inspection = Inspection.new(inspection_params)
      if @inspection.save
        render json: @inspection, status: :created
      else
        render json: @inspection.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @inspection.update(inspection_params)
        render json: @inspection
      else
        render json: @inspection.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @inspection.destroy
      head :no_content
    end
  
    private
  
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end
  
    def inspection_params
      params.require(:inspection).permit(:inspection_date, :location, :inspector_id, :equipment_id, :status)
    end
  end
  