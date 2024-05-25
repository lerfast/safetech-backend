class SafetyDataSheet < ApplicationRecord
    belongs_to :user, foreign_key: "created_by"
  
    validates :title, :content, :created_by, presence: true
  end
  