class Profile < ApplicationRecord
    #belongs_to :profile_info, :polymorphic => true
=begin
    def create(either_user_id)
        Profile.owner = either_user_id
        Profile.save!
        return self.id
        
    end
=end

    def self.show_email?(current_user, other_profile)
        current_profile = Profile.find(current_user.profile_id)
        if(current_profile.mylikes)
            if(current_profile.mylikes.include?(other_profile.id.to_s))#other_pro... might be psuedo code
                #show email
                return other_profile.email
            else
                #don't show email.
                return "?????"
            end
        else
            return "?????"
        end
    end
end