Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'authentication#signup'
      post 'login', to: 'authentication#login'
    end
  end

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
