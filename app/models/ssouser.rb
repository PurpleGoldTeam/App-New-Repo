class Ssouser < ApplicationRecord
    #has_one :profile, as: :profile_info
    
    def self.create_with_omniauth(auth)
        
        s = Ssouser.create!(
            :provider => auth["provider"],
            :uid => auth["uid"],
            :name => auth["info"]["name"])
        #p = s.profile.create!
    end
end
