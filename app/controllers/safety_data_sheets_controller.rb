class SafetyDataSheetsController < ApplicationController
    before_action :set_safety_data_sheet, only: %i[show update destroy]
  
    def index
      @safety_data_sheets = SafetyDataSheet.all
      render json: @safety_data_sheets
    end
  
    def show
      render json: @safety_data_sheet
    end
  
    def create
      @safety_data_sheet = SafetyDataSheet.new(safety_data_sheet_params)
      if @safety_data_sheet.save
        render json: @safety_data_sheet, status: :created
      else
        render json: @safety_data_sheet.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @safety_data_sheet.update(safety_data_sheet_params)
        render json: @safety_data_sheet
      else
        render json: @safety_data_sheet.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @safety_data_sheet.destroy
      head :no_content
    end
  
    private
  
    def set_safety_data_sheet
      @safety_data_sheet = SafetyDataSheet.find(params[:id])
    end
  
    def safety_data_sheet_params
      params.require(:safety_data_sheet).permit(:title, :content, :created_by)
    end
  end
  