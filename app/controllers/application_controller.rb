class ApplicationController < ActionController::API
    include ActionController::Cookies
    # before_action :confirm_authentication

    def login_user
        session[:user_id] = @user.id
        puts "User ID after login: #{session[:user_id]}"
    end

    def logged_in?
        !!session[:user_id]
        puts "Logged in? #{!!session[:user_id]}"
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        puts "Current user: #{User.find_by(id: session[:user_id])}"

    end

    def current_teacher
        puts "Current teacher: #{current_user.teacher}"
        current_user.teacher
    end

    def confirm_authentication
        logged_in?
        if !logged_in?
            render json: {error: "You must be logged in to do that."}, status: :unauthorized
        else
            logged_in?
        end
    end
end
