class CustomList < ApplicationRecord
  belongs_to :user

  validates :title, :items, :user_id, presence: true
end
