class AccessLogsController < ApplicationController
    before_action :set_page_size,only:[:show]
    def modules
        @modules=AccessLog.select(:module_name).group(:module_name).order(:module_name).count(:id)
    end

    def show
        @logs=AccessLog.page(params[:page]).per(@size).where(:module_name => params[:module_name]).order(id: :desc)
    end
end