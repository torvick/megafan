class UsersController < ApplicationController

  before_action :set_user, only: [:show,:edit,:update]

  def index
    @title = t('sidebar.users.list')
    @users = User.all
  end

  def show
    @title = t('sidebar.users.show')
  end

  def new
    @title = t('sidebar.users.new')
    @user = User.new
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t('users.update.success')
      render 'show'
    else
      flash[:warning] = t('users.update.error')
      render 'edit'
    end
  end

  def internal_create
    @user = User.create(user_params)
    if @user.valid?
      flash[:notice] = t('users.create.success')
      render 'show'
    else
      flash[:warning] = t('users.create.error')
      render 'new'
    end
  end

  def edit
    @title = t('sidebar.users.edit')
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
      unless @user
        flash[:warning] = t('users.not_found') 
        render 'index'     
      end
    end

    def user_params
      params.require(:users).permit(:username,:password, :email,:phone,:role_id,:name,:last_name)
    end
end
