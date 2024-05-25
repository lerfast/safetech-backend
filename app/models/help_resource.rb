class HelpResource < ApplicationRecord
  belongs_to :user

  validates :title, :content, :help_type, :user_id, presence: true
end
