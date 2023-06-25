class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :confirm_authentication
    before_action :inspect_session_data

    def inspect_session_data
        puts "is the user logged in? #{session[:user_id] ? "yes" : "no"}}"
        puts "User data: #{User.find_by(id: session[:user_id])}"
    end

    def login_user
        session[:user_id] = @user.id
        puts "User ID after login: #{session[:user_id]}"
    end

    def logged_in?
        !!session[:user_id]
        puts "Logged in? #{!!session[:user_id]}"
    end

    def current_user
        @current_user ||=User.find_by(id: session[:user_id])
        puts "Current user: #{User.find_by(id: session[:user_id])}"
    end

    def current_teacher
        puts "Current teacher: #{current_user.teacher}"
        current_user.teacher
    end

    def confirm_authentication
        render json: {error: "You must be logged in to do that."}, status: :unauthorized unless session[:user_id]
    end
end
