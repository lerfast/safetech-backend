# app/controllers/trainings_controller.rb
class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :update, :destroy]

  # GET /trainings
  def index
    @trainings = Training.all
    render json: @trainings
  end

  # GET /trainings/1
  def show
    render json: @training
  end

  # POST /trainings
  def create
    @training = Training.new(training_params)
    if @training.save
      render json: @training, status: :created, location: @training
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainings/1
  def update
    if @training.update(training_params)
      render json: @training
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainings/1
  def destroy
    @training.destroy
    head :no_content
  end

  private
    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:date, :topic, :instructor, :effectiveness, :training_type)
    end
end
