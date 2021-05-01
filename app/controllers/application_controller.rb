class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? #gives access to methods in views
    
    private
    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
