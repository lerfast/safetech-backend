class AiAnalysis < ApplicationRecord
  belongs_to :user

  validates :title, :description, :input_data, :status, :user_id, presence: true
end
