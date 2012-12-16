Bazasos::Application.routes.draw do
  root to: 'people#index'

  resources :locations
  resources :people
  resources :users

  match '/registration', to: 'users#new'
end
