class SucursalsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
    before_action :set_sucursal, only: %i[show update destroy]
  
    def index
      @sucursals = Sucursal.all
      render json: @sucursals
    end
  
    def show
      render json: @sucursal
    end
  
    def create
      @sucursal = Sucursal.new(sucursal_params)
      if @sucursal.save
        render json: @sucursal, status: :created
      else
        render json: @sucursal.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @sucursal.update(sucursal_params)
        render json: @sucursal
      else
        render json: @sucursal.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @sucursal.destroy
      head :no_content
    end
  
    private
  
    def set_sucursal
      @sucursal = Sucursal.find(params[:id])
    end
  
    def sucursal_params
      params.require(:sucursal).permit(:name, :code, :address)
    end
  end
  