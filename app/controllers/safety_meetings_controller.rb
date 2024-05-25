class SafetyMeetingsController < ApplicationController
    before_action :set_safety_meeting, only: %i[show update destroy]
  
    def index
      @safety_meetings = SafetyMeeting.all
      render json: @safety_meetings
    end
  
    def show
      render json: @safety_meeting
    end
  
    def create
      @safety_meeting = SafetyMeeting.new(safety_meeting_params)
      if @safety_meeting.save
        render json: @safety_meeting, status: :created
      else
        render json: @safety_meeting.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @safety_meeting.update(safety_meeting_params)
        render json: @safety_meeting
      else
        render json: @safety_meeting.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @safety_meeting.destroy
      head :no_content
    end
  
    private
  
    def set_safety_meeting
      @safety_meeting = SafetyMeeting.find(params[:id])
    end
  
    def safety_meeting_params
      params.require(:safety_meeting).permit(:title, :agenda, :meeting_date, :follow_up_actions, :user_id)
    end
  end
  