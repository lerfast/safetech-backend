class QrScan < ApplicationRecord
  belongs_to :user

  validates :data, :scanned_at, presence: true
end
