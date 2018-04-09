class Profile < ActiveRecord::Base
    belongs_to :profile_info, :polymorphic => true
end