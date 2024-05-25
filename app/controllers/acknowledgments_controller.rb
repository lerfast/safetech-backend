class AcknowledgmentsController < ApplicationController
  before_action :set_acknowledgment, only: %i[show update destroy]

  def index
    @acknowledgments = Acknowledgment.all
    render json: @acknowledgments
  end

  def show
    render json: @acknowledgment
  end

  def create
    @acknowledgment = Acknowledgment.new(acknowledgment_params)
    if @acknowledgment.save
      render json: @acknowledgment, status: :created
    else
      render json: @acknowledgment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @acknowledgment.update(acknowledgment_params)
      render json: @acknowledgment
    else
      render json: @acknowledgment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @acknowledgment.destroy
    head :no_content
  end

  private

  def set_acknowledgment
    @acknowledgment = Acknowledgment.find(params[:id])
  end

  def acknowledgment_params
    params.require(:acknowledgment).permit(:title, :description, :date_received, :user_id)
  end
end
