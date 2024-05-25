class Skill < ApplicationRecord
  belongs_to :user

  validates :name, :description, :proficiency, :user_id, presence: true
end
