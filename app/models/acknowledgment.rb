class Acknowledgment < ApplicationRecord
  belongs_to :user

  validates :title, :description, :date_received, :user_id, presence: true
end
