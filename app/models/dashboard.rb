class Dashboard < ApplicationRecord
  belongs_to :user

  validates :title, :description, :data, :user_id, presence: true
end
