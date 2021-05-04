class SessionsController < ApplicationController
    def home
        @user = User.find_by(id: params[:id])
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

    def omniauth
        binding.pry
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:email]
            u.name = auth[:info][:name]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end
        
        if @user.valid?
            flash[:messsage] = "Signed IN with GOOGLE GOOD JOb"
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = "Credential error"
            redirect_to login_path
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
