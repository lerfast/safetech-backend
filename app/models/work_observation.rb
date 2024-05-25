class WorkObservation < ApplicationRecord
  belongs_to :user

  validates :description, :observed_at, :location, :user_id, presence: true
end
