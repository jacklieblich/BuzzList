class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include PublicActivity::StoreController
  
  private
  
  def require_login
    unless logged_in?
      if request.xhr?
        flash[:notice] = "You must be logged in"
        flash.keep(:notice) 
        render :js => "window.location = #{login_path.to_json}"
        else
        store_location
        flash[:error] = "You must be logged in"
        redirect_to login_path
      end
    end
  end
  
 
end
