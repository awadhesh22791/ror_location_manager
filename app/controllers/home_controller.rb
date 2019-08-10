class HomeController < ApplicationController

    def index
        logger.info 'Loading home page.'
    end

    def about
        logger.info 'Loading about page.'
    end
end