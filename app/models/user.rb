# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  
  has_many :incidents, dependent: :destroy
  has_many :training_participations
  has_many :trainings, through: :training_participations
  belongs_to :department
  belongs_to :role

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: I18n.t('errors.messages.invalid_email') }
  validates :first_name, :last_name, presence: true
  validates :department_id, :role_id, presence: true
  validates :password, length: { minimum: 8, message: I18n.t('errors.messages.short_password') }

  scope :admins, -> { joins(:role).where(roles: { name: 'admin' }) }
  scope :standard_users, -> { joins(:role).where(roles: { name: 'user' }) }

  def admin?
    role&.name == 'admin'
  end

  def standard_user?
    role&.name == 'user'
  end
end
