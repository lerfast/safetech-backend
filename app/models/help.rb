class Help < ApplicationRecord
  belongs_to :user

  validates :title, :content, :category, :user_id, presence: true
end
