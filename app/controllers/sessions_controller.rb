class SessionsController < ApplicationController
  def new
  end

      #user shouldn't have to be logged in before logging in
    skip_before_action :set_current_user
    def sso_create
        auth=request.env["omniauth.auth"]
        user=Ssouser.where(:provider => auth["provider"], :uid => auth["uid"]).first ||
        Ssouser.create_with_omniauth(auth)
        session[:user_id] = user.id
        redirect_to root_path
    end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
end
#end #?
