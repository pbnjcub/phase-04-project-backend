class UsersController < ApplicationController
    #signup - create account and log in user
    def create
        @user = User.new(user_params)
        if @user.save
            #logs in user
            login_user #creates new session
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def get_current_user
        if logged_in?
            render json: current_user, status: :ok
        else
            render json: {error: "No current user"}, status: :unprocessable_entity

    private
        def user_params
            params.permit(:username, :password)
        end

end
