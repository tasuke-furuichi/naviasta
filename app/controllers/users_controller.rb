class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index]
  before_action :correct_user, only: [:destroy, :edit, :show]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'アカウント情報を更新しました'
      redirect_to @user
    else 
      flash.now[:danger] = 'アカウント情報を更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = '退会しました'
    redirect_to root_url
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    user = User.find(params[:id])
   if current_user != user
    redirect_to root_url
   end
  end

end
