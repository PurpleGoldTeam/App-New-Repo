class SessionsController < ApplicationController
  # skip_before_action :set_current_user
  def new
  end


      #user shouldn't have to be logged in before logging in
    #skip_before_action :set_current_user
    def sso_create
        auth=request.env["omniauth.auth"]
        user=Ssouser.where(:provider => auth["provider"], :uid => auth["uid"]).first ||
        Ssouser.create_with_omniauth(auth)
#=begin
        if(user.profile_id == nil)
          p = Profile.create!
          user.profile_id = p.id
          #p.owner = user.id
          user.save!
          #p.save!
        end
#=end
        session[:user_id] = user.id
        redirect_to root_path

    end

  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # Log the user in and redirect to the user's show page.
       if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
    # if(user.profile_id == nil)
    #       p = Profile.create!
    #       user.profile_id = p.id
    #       #p.owner = user.id
    #       user.save!
    #       #p.save!
    # end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url
    flash[:notice] = 'Logged out successfully'
  end
    # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
    # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
#end #?
