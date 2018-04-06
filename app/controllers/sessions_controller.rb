class SessionsController < ApplicationController
    #user shouldn't have to be logged in before logging in
    skip_before_action :set_current_user
    def create
        #if request.fullpath == '/signup' || request.fullpath == '/login'
         #   redirect_to '/help'
          #  #ruffine's create
        #else
        
        
            auth=request.env["omniauth.auth"]
            user=Ssouser.where(:provider => auth["provider"], :uid => auth["uid"]).first ||
            Ssouser.create_with_omniauth(auth)
            session[:user_id] = user.id
            redirect_to root_path
        #end
    end
    def destroy
        session.delete(:user_id)
        flash[:notice] = 'Logged out successfully'
        redirect_to '/static_pages/home'
    end
    
end
