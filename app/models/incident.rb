# app/models/incident.rb
class Incident < ApplicationRecord
    belongs_to :user
    belongs_to :incident_type
    # Asegúrate de que no haya validaciones que impidan la creación aparte de las asociaciones
  end
  