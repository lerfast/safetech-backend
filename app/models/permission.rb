class Permission < ApplicationRecord
    validates :name, :description, presence: true
  end
  