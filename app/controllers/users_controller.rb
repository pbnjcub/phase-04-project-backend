class UsersController < ApplicationController
    #signup - create account and log in user
    def create
        @user = User.new(user_params)
        binding.pry
        if @user.save
            #logs in user
            login_user #creates new session
            encrypted_password = @user.password_digest
            binding.pry
            render json: { user: @user, encrypted_password: encrypted_password }, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def get_current_user
        if logged_in?
            render json: current_user, status: :ok
        else
            render json: {error: "No current user"}, status: :unprocessable_entity
        end
    end


    private
        def user_params
            params.require(:user).permit(:username, :password, :password_digest, teacher_attributes: [:first_name, :last_name, :email])
        end

end
