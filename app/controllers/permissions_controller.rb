class PermissionsController < ApplicationController
    before_action :set_permission, only: %i[show update destroy]
  
    def index
      @permissions = Permission.all
      render json: @permissions
    end
  
    def show
      render json: @permission
    end
  
    def create
      @permission = Permission.new(permission_params)
      if @permission.save
        render json: @permission, status: :created
      else
        render json: @permission.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @permission.update(permission_params)
        render json: @permission
      else
        render json: @permission.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @permission.destroy
      head :no_content
    end
  
    private
  
    def set_permission
      @permission = Permission.find(params[:id])
    end
  
    def permission_params
      params.require(:permission).permit(:name, :description)
    end
  end
  