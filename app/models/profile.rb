class Profile < ApplicationRecord
    #belongs_to :profile_info, :polymorphic => true
=begin
    def create(either_user_id)
        Profile.owner = either_user_id
        Profile.save!
        return self.id
        
    end
=end
end