Rails.application.routes.draw do
  resources :users, only: [:index]

  resources :students, only: [:index, :show, :create, :update, :destroy] do
    collection do
      get 'all_students', to: 'students#all_students'
    end
    resources :courses, only: [:index, :create, :update, :destroy]
  end

  resources :teachers, only: [:index, :show, :create, :update, :destroy] do
    resources :courses, only: [:index, :create, :update, :destroy] do
      member do
        post 'enroll/:student_id', to: 'courses_students#create'
        delete 'unenroll/:student_id', to: 'courses_students#destroy'
      end
    end
  end

  resources :courses, only: [:index, :show, :create, :update, :destroy] do
    resources :students, only: [:index, :create, :update, :destroy]
  end

  resources :courses_students, only: [:index, :update]

  post '/signup', to: 'users#create'
  get '/current-user', to: 'users#get_current_user'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end