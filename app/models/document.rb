class Document < ApplicationRecord
  belongs_to :user

  validates :title, :content, :document_type, :user_id, presence: true
end
