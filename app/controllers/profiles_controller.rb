class ProfilesController < ApplicationController
    def index
        @profiles = Profile.all
    end
    
    def show
        @profile = Profile.find(params[:id])
    end
    
    def add_like
        Profile.add_like(params[:profiles])
        redirect_to '/profiles'
    end
end