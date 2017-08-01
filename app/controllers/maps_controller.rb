class MapsController < ApplicationController
  
  before_action :require_user_logged_in, only: [:destroy, :edit, :update, :new, :create]
  before_action :correct_user, only: [:destroy, :edit]
  
  

  def create
    @map = current_user.maps.build(map_params)
    if @map.save
      flash[:success] = 'マップを作成しました'
      redirect_to 'maps/edit'
    else
      @maps = current_user.maps.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'マップ作成に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @map = Map.find(params[:id])
    flash[:success] = 'マップを削除しました'
    redirect_back(fallback_location: root_path)
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])
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
    @map = Map.find(params[:id])
    @pages = @map.pages
  end
  
  def map_params
    params.require(:map).permit(:name, :status, :language, :map_url)
  end
  
  def correct_user
    @map = current_user.maps.find_by(id: params[:id])
    unless @map
      redirect_to root_url
    end
  end
  
end
