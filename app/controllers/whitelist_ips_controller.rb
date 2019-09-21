class WhitelistIpsController < ApplicationController
    before_action :set_page_size,only:[:index]
    before_action :require_user, except: [:new,:create]
    before_action :require_admin    
    def index
        @whitelist_ips=WhitelistedIp.page(params[:page]).per(@size)
    end
end