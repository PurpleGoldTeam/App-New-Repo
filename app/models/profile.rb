class Profile < ActiveRecord::Base
    belongs_to :profile_info, :polymorphic => true
    def create
        Profile.owner = @current_user.id
        Profile.save!
    end
end