class Capa < ApplicationRecord
  belongs_to :incident
  belongs_to :responsible_person, class_name: 'User'

  validates :action_description, :responsible_person_id, :start_date, :end_date, :priority, :status, :incident_id, presence: true
end
