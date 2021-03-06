class UsersController < ApplicationController
    before_action :set_user, only: [:edit,:show,:update]
    before_action :set_page_size,only:[:index]
    before_action :require_anonymous, only:[:new,:create]
    before_action :require_user, except: [:new,:create]
    before_action :require_same_user, only: [:edit,:update,:destroy]

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            flash[:success]="Welcome #{@user.username}"
            redirect_to user_path(@user)
        else
            render "new"
        end
    end

    def edit
        # private set_user automatically fetch user by id to populate.
    end

    def update
        if @user.update(user_params)
            flash[:success]="User updated successfully."
            redirect_to users_path
        else
            render 'edit'
        end
    end

    def show
        # private set_user automatically fetch user by id to use.
    end

    def index
        @users=User.page(params[:page]).per(@size)
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
        params.require(:user).permit(:username,:email,:password,:admin)
    end

    def require_same_user
        if current_user!=@user && !current_user.admin?
            flash[:danger]="You can edit or destroy your own account."
            redirect_to users_path
        end
    end
end