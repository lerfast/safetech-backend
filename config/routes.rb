Rails.application.routes.draw do
  resources :users
  resources :sucursals
  resources :roles
  resources :permissions
  resources :incidents
  resources :corrective_actions
  resources :audits
  resources :inspections
  resources :notifications
  resources :documents
  resources :courses
  resources :enrollments
  resources :qr_scans
  resources :incident_reports
  resources :complete_audits
  resources :work_observations
  resources :safety_meetings
  resources :tasks
  resources :acknowledgments
  resources :trainings
  resources :skills
  resources :safety_data_sheets
  resources :forms
  resources :system_documents
  resources :personal_lists
  resources :dashboards
  resources :reports
  resources :ai_analyses
  resources :helps
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
