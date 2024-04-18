# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  
  has_many :incidents, dependent: :destroy
  belongs_to :department
  belongs_to :role
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true

  # Metodos para verificar el rol del usuario
  def admin?
    role == 'admin'
  end

  def standard_user?
    role == 'user'
  end
end
