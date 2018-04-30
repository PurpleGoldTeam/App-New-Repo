class Profile < ApplicationRecord
    #belongs_to :profile_info, :polymorphic => true
=begin
    def create(either_user_id)
        Profile.owner = either_user_id
        Profile.save!
        return self.id
        
    end
=end

    def self.add_like(profiles)
        current_profile_id = profiles.scan(/=([^o]*)/).first.first
        current_profile = Profile.find(current_profile_id)
        other_profile_id = profiles.scan(/=([^o]*)/).last.last
        if(current_profile.mylikes.include?(other_profile_id))
            current_profile.mylikes.slice!(other_profile_id)
            current_profile.save!
        else
            current_profile.mylikes << ", #{other_profile_id}"
            current_profile.save!
        end
    end
    
    def self.show_email?(current_user, other_profile)
        current_profile = Profile.find(current_user.profile_id)
        
        if(!current_profile.mylikes)
            current_profile.mylikes = " "
            current_profile.save!
        end
        if(!other_profile.mylikes)
            other_profile.mylikes = ""
            other_profile.save!
        end

        if(current_profile.mylikes.include?(other_profile.id.to_s) &&
        other_profile.mylikes.include?(current_profile.id.to_s))
            #show email
            return other_profile.email
        else
            #don't show email.
            return "?????"
        end
    end
    
    def self.liked?(current_user, other_profile)
        current_profile = Profile.find(current_user.profile_id)
        if(current_profile.mylikes)
            if(current_profile.mylikes.include?(other_profile.id.to_s))#other_pro... might be psuedo code
                #show email
                return "unlike"
            else
                #don't show email.
                return "like"
            end
        else
            return "like"
        end
    end
    

end