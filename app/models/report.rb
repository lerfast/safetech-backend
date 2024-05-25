class Report < ApplicationRecord
    belongs_to :user, foreign_key: "generated_by"
  
    validates :title, :content, :report_type, :generated_by, presence: true
  end
  