class Specialization < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	
	has_one :specdatum
	has_many :moderators, :foreign_key => 'specialization_id', :class_name => "User"
	has_many :vmilists
end
