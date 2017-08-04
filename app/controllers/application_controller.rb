class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def correct_user
    @user = current_user.find_by(id: params[:id])
    unless @user
      redirect_to root_url
    end
  end
  
  
end
