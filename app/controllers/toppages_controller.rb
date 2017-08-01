class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @map = current_user.maps.build  # form_for 用
      @maps = current_user.maps.order('created_at DESC').page(params[:page])
    end
  end
end
