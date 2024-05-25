class Document < ApplicationRecord
    validates :title, :content, :document_type, :created_by, presence: true
  end
  