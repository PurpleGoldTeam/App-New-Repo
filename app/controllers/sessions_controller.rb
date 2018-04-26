class SessionsController < ApplicationController
  skip_before_action :set_current_user
  def new
  end


      #user shouldn't have to be logged in before logging in
    skip_before_action :set_current_user
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
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
    if(user.profile_id == nil)
          p = Profile.create!
          user.profile_id = p.id
          #p.owner = user.id
          user.save!
          #p.save!
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url
    flash[:notice] = 'Logged out successfully'
  end
end
#end #?
