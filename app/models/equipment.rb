class Equipment < ApplicationRecord
    has_many :inspections
    validates :name, :description, :serial_number, presence: true
  end
  