class WorkObservation < ApplicationRecord
  belongs_to :user

  validates :description, :observed_at, :user_id, presence: true
end
