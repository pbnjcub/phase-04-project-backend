class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        #authenticate is a new method that comes from BCrypt. It takes a string and hashes it and compares it to the password_digest
        if @user && @user.authenticate(params[:password])
            #logs in user
            login_user #creates new session
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    #logout
    def destroy
        session.clear
    end
end
