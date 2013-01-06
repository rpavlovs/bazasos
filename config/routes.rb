Bazasos::Application.routes.draw do
  root to: 'people#index'
  resources :users, except: 'show'
  resources :sessions, only: %w[new create destroy]
  get 'log_out' => 'sessions#destroy', as: 'log_out'
  resources :people do
    resources :allergies
    resources :emergency_contacts
    resources :locations
    resources :medications
  end
end
