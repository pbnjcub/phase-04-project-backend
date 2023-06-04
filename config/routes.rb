Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :students, only: [:index, :show, :create, :update, :destroy]
  resources :courses, only: [:index, :show, :create, :update, :destroy]
  resources :teachers, only: [:index, :show, :create, :update, :destroy]

  post '/signup', to: 'users#create'
  get '/current-user', 'users#get_current_user'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
