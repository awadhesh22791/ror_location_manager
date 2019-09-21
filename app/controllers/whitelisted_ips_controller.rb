class WhitelistedIpsController < ApplicationController
    before_action :set_page_size,only:[:index]
    before_action :require_user, except: [:new,:create]
    before_action :require_admin 
    before_action :set_whitelist_ip,only:[:edit,:update,:show,:destroy]   
    def index
        @whitelist_ips=WhitelistedIp.page(params[:page]).per(@size)
    end

    def new
        @whitelist_ip = WhitelistedIp.new
    end

    def edit
        # private set_whitelisted_ip automatically fetch whitelisted_ip by id populate data.
    end

    def update
        if @whitelist_ip.update(whitelisted_params)
            flash[:success]="Ip updated successfully."
            redirect_to whitelisted_ip_path(@whitelist_ip)
        else
            render 'edit'
        end
    end

    def show
        # private set_whitelisted_ip automatically fetch whitelisted_ip by id populate data.
    end

    def create
        @whitelist_ip=WhitelistedIp.new(whitelisted_params)
        if @whitelist_ip.save
            flash[:success]='Ip was created successfully.'
            redirect_to whitelisted_ips_path(@whitelist_ip)
        else
            render 'new'
        end
    end

    def destroy
        @whitelist_ip.destroy
        flash[:danger]='Ip deleted successfully.'
        redirect_to whitelisted_ips_path
    end

    private
        def whitelisted_params
            params.require(:whitelisted_ip).permit(:ip,:blocked)
        end

        def set_whitelist_ip
            @whitelist_ip=WhitelistedIp.find(params[:id])
        end
end