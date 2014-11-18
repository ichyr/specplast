class Specialization < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	
	has_one :specdatum, dependent: :destroy
	has_many :moderators, :foreign_key => 'specialization_id', :class_name => "User"
	has_many :vmilists

	accepts_nested_attributes_for :specdatum, allow_destroy: true

	validates :name, presence: true, length: { minimum: 4}
	
end
