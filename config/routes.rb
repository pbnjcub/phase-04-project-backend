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
    resources :courses
      # member do
      #   post 'enroll/:student_id', to: 'courses_students#create'
      #   delete 'unenroll/:student_id', to: 'courses_students#destroy'
      # end
  end

  resources :courses do
    resources :students
  end

  get '/courses_students/:grade', to: 'courses_students#find_grade'

  # resources :courses_students
  post '/courses/:course_id/enroll/:student_id', to: 'courses_students#create'
  delete '/courses/:course_id/unenroll/:student_id', to: 'courses_students#destroy'
  post '/signup', to: 'users#create'
  get '/current-user', to: 'users#get_current_user'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/all_courses', to: 'courses#all_courses'
  get '/all_students', to: 'students#all_students'


end