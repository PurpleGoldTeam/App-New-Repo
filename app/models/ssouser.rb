class Ssouser < ApplicationRecord
    def self.create_with_omniauth(auth)
        SSouser.create!(
            :provider => auth["provider"],
            :uid => auth["uid"],
            :name => auth["info"]["name"])
    end
end
