class StatesController < ApplicationController

    def index
        @states=State.page params[:page]
    end

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

    def edit
        @state=State.find(params[:id])
    end

    def update
        @state=State.find(params[:id])
        if @state.update(state_params)
            flash[:notice]="State updated successfully."
            redirect_to state_path(@state)
        else
            render 'edit'
        end
    end

    def destroy
        @state=State.find(params[:id])
        @state.destroy
        flash[:notice]='State deleted successfully.'
        redirect_to states_path
    end

    private
        def state_params
            params.require(:state).permit(:name,:short_name)
        end

end