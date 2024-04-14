Rails.application.routes.draw do
  resources :users
  resources :departments
  resources :roles
  resources :incidents
  resources :incident_types
  resources :reports
  resources :actions
  resources :trainings
  resources :training_records
  resources :audits
  resources :audit_items
end
