Rails.application.routes.draw do
  # resources :users, only: [:index]
  resources :sessions, only: [:index]

  resources :students do
    collection do
      get 'all_students', to: 'students#all_students'
    end
    resources :courses
  end

  resources :teachers do
    resources :courses do
      member do
        post 'enroll/:student_id', to: 'courses_students#create'
        delete 'unenroll/:student_id', to: 'courses_students#destroy'
      end
    end
  end

  resources :courses do
    resources :students
  end

  resources :courses_students

  post '/signup', to: 'users#create'
  get '/current-user', to: 'users#get_current_user'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/all_courses', to: 'courses#all_courses'
  get '/all_students', to: 'students#all_students'


end