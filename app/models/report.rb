class Report < ApplicationRecord
  belongs_to :user

  validates :title, :content, :report_type, :user_id, presence: true
end
