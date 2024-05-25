class Skill < ApplicationRecord
  belongs_to :user

  validates :name, :proficiency, :user_id, presence: true
end
