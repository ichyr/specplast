class Vmilist < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader

	belongs_to :specialization
end
