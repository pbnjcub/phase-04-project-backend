class ApplicationController < ActionController::API
    include ActionController::Cookies

    def login_user
        session[:user_id] = @user.id
    end

    

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def current_teacher
        current_user.teacher
    end
end
