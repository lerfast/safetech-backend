class QrScan < ApplicationRecord
  belongs_to :user

  validates :scanned_data, :user_id, presence: true
end
