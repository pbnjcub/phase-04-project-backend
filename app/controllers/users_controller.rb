class UsersController < ApplicationController
    skip_before_action :confirm_authentication
    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
    end
    #signup - create account and log in user
    def create
        @user = User.new(user_params)
        if @user.save
            #logs in user
            login_user #creates new session
            render json: @user, status: :created, serializer: UserSerializer
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def get_current_user
        if logged_in?
            render json: current_user, status: :ok, serializer: UserSerializer
        else
            render json: {error: "No current user"}, status: :unprocessable_entity
        end
    end


    private
        def user_params
            params.permit(:username, :password, teacher_attributes: [:first_name, :last_name, :email])
        end

end
