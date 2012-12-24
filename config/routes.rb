Bazasos::Application.routes.draw do
  root to: 'people#index'
  resources :users
  resources :people do
    resources :allergies
    resources :emergency_contacts
    resources :locations
    resources :medications
  end
  match '/registration', to: 'users#new'
end
