class Acknowledgment < ApplicationRecord
  belongs_to :user

  validates :title, :description, :date_awarded, :user_id, presence: true
end
