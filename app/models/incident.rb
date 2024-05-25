class Incident < ApplicationRecord
  belongs_to :user

  validates :description, :incident_date, :reported_date, :location, :severity, :status, presence: true
end
