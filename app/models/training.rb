# app/models/training.rb
class Training < ApplicationRecord
    has_many :training_participations
    has_many :users, through: :training_participations
  
    validates :topic, :date, :instructor, :training_type, presence: true
  
    enum training_type: {
      safety_training: "safety_training",
      hazmat: "hazmat",
      fire_prevention: "fire_prevention",
      first_aid_cpr: "first_aid_cpr",
      ergonomics: "ergonomics",
      environmental_management: "environmental_management",
      legal_compliance: "legal_compliance",
      psychological_safety: "psychological_safety",
      emergency_response: "emergency_response",
      cybersecurity: "cybersecurity"
    }
  end
  