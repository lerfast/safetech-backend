class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, :course_id, :status, presence: true
end
