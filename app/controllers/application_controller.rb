class ApplicationController < ActionController::Base
#used for user
  protect_from_forgery with: :exception
  include SessionsHelper
#used for sso_user
  before_action :set_current_user
  
 
  
  #book uses just 'protected', hopefully line below is fine
  protect_from_forgery with: :exception
  def set_current_user
    #we exploit the fact that below query may return nil
    @current_user ||= Ssouser.where(id: session[:user_id]).first
    #redirect_to login_path and return unless @current_user
  end
  
  def welcome
    render html: "Welcome"
  end
  
  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end  

 
end
