class Audit < ApplicationRecord
  belongs_to :auditor, class_name: 'User'

  validates :audit_date, :location, :auditor_id, :description, :status, presence: true
end
