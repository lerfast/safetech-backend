class Capa < ApplicationRecord
  belongs_to :incident

  validates :action_description, :responsible_person, :start_date, :end_date, :priority, :status, presence: true
end
