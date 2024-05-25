class NotificationsController < ApplicationController
    before_action :set_notification, only: %i[show update destroy]
  
    def index
      @notifications = Notification.all
      render json: @notifications
    end
  
    def show
      render json: @notification
    end
  
    def create
      @notification = Notification.new(notification_params)
      if @notification.save
        render json: @notification, status: :created
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @notification.update(notification_params)
        render json: @notification
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @notification.destroy
      head :no_content
    end
  
    private
  
    def set_notification
      @notification = Notification.find(params[:id])
    end
  
    def notification_params
      params.require(:notification).permit(:message, :user_id, :read_status)
    end
  end
  