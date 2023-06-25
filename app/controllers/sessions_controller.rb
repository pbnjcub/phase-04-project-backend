class SessionsController < ApplicationController
    skip_before_action :confirm_authentication, only: [:create]
    #create a new session, not user

    def create
        user = User.find_by(username: params[:username])
        if user.authenticate(params[:password])
            puts "session object: ${session[:user_id]}"
            session[:user_id] = user.id
            render json: user, status: :ok, include: ['teacher']
        else
            render json: {errors:['Invalid username or password']}, status: :unprocessable_entity
        end
        # @user = User.find_by(username: params[:username])
        # #authenticate is a new method that comes from BCrypt. It takes a string and hashes it and compares it to the password_digest
        # if @user && @user.authenticate(params[:password])
        #     #logs in user
        #     login_user #creates new session
        #     render json: @user, status: :created, include: ['teacher']
        # else
        #     render json: {errors:['Invalid username or password']}, status: :unprocessable_entity
        # end
    end

    #logout
    def destroy
        session.clear
    end
end
