class UsersController < ApplicationController
   before_action :users_performances, only: [:show]
   before_action :find_user, only: [:show]

    #Sign Up
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Successfully signed up."
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user
        @blogs = current_user.blogs
        # redirect_to '/' if !@user
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :email)
    end

    def users_performances
        @performances = current_user.created_performances
    end

    def user_current_id
        @user = current_user.id
    end

    def find_user
        @user = User.find_by_id(params[:user_id])
    end
end
