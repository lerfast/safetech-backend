class IncidentReport < ApplicationRecord
  belongs_to :user

  validates :consequences, :event_details, :personal_injuries, :asset_damage, :event_severity, :user_id, presence: true
end
