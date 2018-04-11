class Ssouser < ApplicationRecord
    has_one :profile, as: :profile_info
    
    def self.create_with_omniauth(auth)
        Ssouser.create!(
            :provider => auth["provider"],
            :uid => auth["uid"],
            :name => auth["info"]["name"])
    end
end
