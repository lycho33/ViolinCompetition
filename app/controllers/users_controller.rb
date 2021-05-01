class UsersController < ApplicationController
   before_action :users_performances, only: [:show]
   before_action :user_current_id, only: [:show]

    #Sign Up
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Successfully signed up."
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        redirect_to '/' if !@user
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :email)
    end

    def users_performances
        @performances = current_user.performances
    end

    def user_current_id
        @user = current_user.id
    end
end
