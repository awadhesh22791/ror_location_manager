class StatesController < ApplicationController
    def new
        @state=State.new
    end

    def create
        #render plain: params[:state].inspect
        @state=State.new(state_params)
        if @state.save
            flash[:notice]='State was created successfully.'
            redirect_to state_path(@state)
        else
            render 'new'
        end
    end

    def show
        @state=State.find(params[:id])
    end

    private
        def state_params
            params.require(:state).permit(:name,:short_name)
        end

end