class ApplicationController < ActionController::Base
    add_flash_types :success, :warning, :danger, :info
    before_action :add_access_log
    before_action :check_ip
    helper_method :current_user, :logged_in?

    def require_admin
        if !current_user.admin?
            flash[:danger]="You must be admin to perform that action."
            redirect_to root_path
        end
    end

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

    def add_access_log
        @ip=request.env['HTTP_X_FORWARDED_FOR']
        if @ip.nil?
            @ip=request.remote_ip
        end
        @module_name="#{params[:controller]} -> #{params[:action]}"
        AccessLog.create(:module_name=>@module_name,:ip=>@ip)
    end

    def check_ip
        @ip=request.env['HTTP_X_FORWARDED_FOR']
        if @ip.nil?
            @ip=request.remote_ip
        end
        @whitelisted_ip=WhitelistedIp.find_by ip:@ip
        if !@whitelisted_ip.nil? && @whitelisted_ip.blocked
            redirect_to '/blocked_ip'
        end
    end

    private
        def set_page_size
            if params[:records].to_i==0
                @size=Kaminari.config.default_per_page
            else
                @size=params[:records].to_i
            end
        end       
end
