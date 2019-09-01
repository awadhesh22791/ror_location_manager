class HomeController < ApplicationController

    def index
        logger.info 'Loading home page.'
        redirect_to countries_path if logged_in?
    end

    def about
        logger.info 'Loading about page.'
    end
end