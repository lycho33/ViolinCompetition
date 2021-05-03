module ApplicationHelper
    def current_user
        @user ||= User.find_by_id(session[:user_id]) if session[:user_id].present?

    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
