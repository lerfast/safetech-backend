class Form < ApplicationRecord
  belongs_to :user

  validates :title, :description, :form_data, :user_id, presence: true
end
