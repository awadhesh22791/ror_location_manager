class WhitelistIpsController < ApplicationController
    before_action :set_page_size,only:[:index]
    
    def index
        @whitelist_ips=WhitelistedIp.page(params[:page]).per(@size)
    end
end