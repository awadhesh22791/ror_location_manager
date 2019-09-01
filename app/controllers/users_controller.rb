class UsersController < ApplicationController
    before_action :set_user, only: [:edit,:show,:update]
    before_action :require_user

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            flash[:success]="Welcome #{@user.username}"
            redirect_to root_path
        else
            render "new"
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success]="User updated successfully."
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def show
    end

    def index
        @users=User.page params[:page]
    end

    def destroy
        @user.destroy
        flash[:danger]='User deleted successfully.'
        redirect_to users_path
    end

    private
    def set_user
        @user=User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end