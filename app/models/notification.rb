class Notification < ApplicationRecord
  belongs_to :user

  validates :message, :user_id, presence: true
  validates :read_status, inclusion: { in: [true, false] }
end
