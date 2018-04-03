class ApplicationController < ActionController::Base

  #before_filter :set_current_user
  before_action :set_current_user #above has been deprecated
  
  #book uses just 'protected', hopefully line below is fine
  protect_from_forgery with: :exception
  def set_current_user
    #we exploit the fact that below query may return nil
    @current_user ||= Ssouser.find_by(id: session[:user_id])
    redirect_to login_path and return unless @current_user
  end
  
  def welcome
    render html: "Welcome"
  end
end
