class SafetyMeeting < ApplicationRecord
  belongs_to :user

  validates :title, :meeting_date, :location, :description, :user_id, presence: true
end
