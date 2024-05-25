class PersonalListsController < ApplicationController
    before_action :set_personal_list, only: %i[show update destroy]
  
    def index
      @personal_lists = PersonalList.all
      render json: @personal_lists
    end
  
    def show
      render json: @personal_list
    end
  
    def create
      @personal_list = PersonalList.new(personal_list_params)
      if @personal_list.save
        render json: @personal_list, status: :created
      else
        render json: @personal_list.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @personal_list.update(personal_list_params)
        render json: @personal_list
      else
        render json: @personal_list.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @personal_list.destroy
      head :no_content
    end
  
    private
  
    def set_personal_list
      @personal_list = PersonalList.find(params[:id])
    end
  
    def personal_list_params
      params.require(:personal_list).permit(:title, :items, :user_id)
    end
  end
  