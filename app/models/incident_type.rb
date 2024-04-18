# app/models/incident_type.rb
class IncidentType < ApplicationRecord
    has_many :incidents
  end