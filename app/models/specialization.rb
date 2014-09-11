class Specialization < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	has_one :specdatum
	has_many :users
end
