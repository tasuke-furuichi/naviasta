class MapsController < ApplicationController
  
  before_action :require_user_logged_in, only: [:destroy, :edit, :update, :new, :create, :index]
  before_action :correct_user, only: [:destroy, :edit]
  
  

  def create
    @map = current_user.maps.build(map_params)
    if @map.save
      flash[:success] = 'マップを作成しました'
      redirect_to @map
    else
      @maps = current_user.maps.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'マップ作成に失敗しました'
      
      render root_path
    end
  end

  def destroy
    @map = Map.friendly.find(params[:id])
    @map.destroy
    flash[:success] = 'マップを削除しました'
    
    redirect_to root_url
  end

  def edit
    @map = Map.friendly.find(params[:id])
  end

  def update
    @map = Map.friendly.find(params[:id])
    if @map.update(map_params)
      flash[:success] = 'マップを編集しました'
      redirect_to @map
    else 
      flash.now[:danger] = 'マップの編集に失敗しました'
      render :edit
    end
  end

  def index
    @maps = Map.all.page(params[:page]) 
  end

  def show
    #@map = Map.friendly.find(params[:id])
    @map = Map.friendly.find(params[:id])
    @pages = @map.pages
  end
  
  
  def mail_send
    user = User.find(params[:user_id])
    @mail = NoticeMailer.sendmail_confirm(user).deliver
    render :text => 'send finish'
    
  end
  
  
  private
  
  def map_params
    params.require(:map).permit(:name, :status, :language, :map_url)
  end
  
  def correct_user
    user = Map.friendly.find(params[:id]).user
   if current_user != user
    redirect_to root_url
   end
  end
  
end
