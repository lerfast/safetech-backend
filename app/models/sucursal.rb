class Sucursal < ApplicationRecord
    validates :name, :code, :address, presence: true
  end
  