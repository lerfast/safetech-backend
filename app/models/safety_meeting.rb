class SafetyMeeting < ApplicationRecord
  belongs_to :user

  validates :title, :agenda, :meeting_date, :follow_up_actions, :user_id, presence: true
end
