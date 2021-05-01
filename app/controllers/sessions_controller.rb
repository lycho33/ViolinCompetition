class SessionsController < ApplicationController
    def home
    end

    #for login
    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            flash[:message] = "You have successfully signed in"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Incorrect Login. Try again"
            render :new
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end
end
