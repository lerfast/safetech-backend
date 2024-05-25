class CompleteAudit < ApplicationRecord
  belongs_to :user

  validates :scope, :specific_questions, :audit_details, :corrective_actions, :audit_type, :user_id, presence: true
end
