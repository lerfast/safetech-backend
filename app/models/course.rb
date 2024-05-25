class Course < ApplicationRecord
    belongs_to :instructor, class_name: 'User'
  
    validates :title, :description, :start_date, :end_date, :instructor_id, presence: true
  end
  