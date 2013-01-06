Bazasos::Application.routes.draw do
  root to: 'people#index'
  resources :users, except: 'show'
  resources :people do
    resources :allergies
    resources :emergency_contacts
    resources :locations
    resources :medications
  end
end
