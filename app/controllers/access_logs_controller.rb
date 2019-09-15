class AccessLogsController < ApplicationController
    def modules
        @modules=AccessLog.select(:module_name).group(:module_name).order(:module_name).count(:id)
    end
end