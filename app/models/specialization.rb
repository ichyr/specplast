class Specialization < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	has_one :specdata
end
