Bazasos::Application.routes.draw do
  root to: 'people#index'
  resources :users
  resources :people do
    resources :locations
  end
  match '/registration', to: 'users#new'
end
