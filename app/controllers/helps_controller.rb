class HelpsController < ApplicationController
    before_action :set_help, only: %i[show update destroy]
  
    def index
      @helps = Help.all
      render json: @helps
    end
  
    def show
      render json: @help
    end
  
    def create
      @help = Help.new(help_params)
      if @help.save
        render json: @help, status: :created
      else
        render json: @help.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @help.update(help_params)
        render json: @help
      else
        render json: @help.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @help.destroy
      head :no_content
    end
  
    private
  
    def set_help
      @help = Help.find(params[:id])
    end
  
    def help_params
      params.require(:help).permit(:title, :content, :category, :user_id)
    end
  end
  