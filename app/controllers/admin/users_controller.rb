class Admin::UsersController < BaseAdminController

  before_action :load_user, only: [:edit, :update, :destroy, :show]
  before_action :user_page_exist?, only:[:edit, :update, :destroy, :show]
  before_action :authenticate_user!

  def index
    @users = User.all.where("user_roles like ?", "%user%")
    authorize! :manage, @users
  end

  def show
  end

  def edit

  end

  def update
    @user.update_attributes(user_params)
    redirect_to admin_users_path
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path
    end
  end


  private
    def load_user
      @user = User.find_by(id: params[:id])
    end

    def user_page_exist?
      redirect_to "/404" unless @user
    end

    def user_params
      params.require(:user).permit(:email, :user_roles)
    end

end
