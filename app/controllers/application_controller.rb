class ApplicationController < ActionController::Base
    add_flash_types :success, :warning, :danger, :info

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger]="You must be logged in to perform that action."
            redirect_to root_path
        end
    end

    def require_anonymous
        if logged_in?
            flash[:danger]="You must be logout to perform that action."
            redirect_to root_path
        end
    end
end
