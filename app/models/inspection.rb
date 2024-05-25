class Inspection < ApplicationRecord
  belongs_to :inspector, class_name: 'User'
  belongs_to :equipment

  validates :inspection_date, :location, :inspector_id, :equipment_id, :status, presence: true
end
