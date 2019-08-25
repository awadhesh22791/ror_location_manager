class StatesController < ApplicationController

    before_action :set_state, only: [:edit,:show,:update,:destroy]

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
            flash[:success]='State was created successfully.'
            redirect_to state_path(@state)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @state.update(state_params)
            flash[:success]="State updated successfully."
            redirect_to state_path(@state)
        else
            render 'edit'
        end
    end

    def destroy
        @state.destroy
        flash[:danger]='State deleted successfully.'
        redirect_to states_path
    end

    private
        def set_state
            @state=State.find(params[:id])
        end

        def state_params
            params.require(:state).permit(:name,:short_name)
        end

end