class PagesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def index
    @pages = Page.all.page(params[:page])
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @map = Map.find(params[:map_id])
    @page = Page.new
  end

  def create
    @map = Map.find(params[:map_id])
    @page = @map.pages.build(page_params)
    if @page.save
      flash[:success] = 'ページを保存しました'
      redirect_to 'maps/show'
    else
      #@pages = @map.pages.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'ページ作成に失敗しました'
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def upadate
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:success] = 'ページを編集しました'
      redirect_to @page
    else
      flash.now[:danger] = 'ページを編集できませんでした'
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    flash[:success] = 'ページを削除しました'
    redirect_to pages_url
  end
  
  private
  
  def page_params
    params.require(:page).permit(:page_number, :text)
  end
  
end
