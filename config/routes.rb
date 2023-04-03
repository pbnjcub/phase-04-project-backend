Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :students, only: [:index, :show, :create, :update, :destroy]
  resources :subjects, only: [:index, :show, :create, :update, :destroy]
  resources :assignments, only: [:index, :show, :create, :update, :destroy]
end
