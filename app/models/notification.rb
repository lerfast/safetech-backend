class Notification < ApplicationRecord
  belongs_to :user

  validates :message, :user_id, :read_status, presence: true
end
