class CitiesController < ApplicationController
    before_action :set_city,only:[:show,:edit,:destroy,:update]
    before_action :set_page_size,only:[:index]

    def index        
        @cities=City.page(params[:page]).per(@size)
    end

    def show
        # private set_city automatically fetch city by id to use.
    end

    def new
        @city=City.new
    end

    def create

        @city=City.new(city_params)
        if @city.save
            flash[:success]="City was created successfully."
            redirect_to city_path(@city)
        else
            render "new"
        end

    end

    def update
        if @city.update(city_params)
            flash[:success]="City updated successfully."
            redirect_to cities_path
        else
            render "edit"
        end
    end

    def edit
        # private set_city automatically fetch city by id to populate data.
    end

    def destroy
        @city.destroy
        flash[:danger]="City deleted successfully."
        redirect_to cities_path
    end

    private
        def set_city
            @city=City.find(params[:id])
        end

        def city_params
            params.require(:city).permit(:name)
        end

end