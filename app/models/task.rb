class Task < ApplicationRecord
  belongs_to :user

  validates :title, :description, :due_date, :status, :user_id, presence: true
end
