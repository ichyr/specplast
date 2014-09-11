class Vmilist < ActiveRecord::Base

	after_initialize :check_defaults, :if => :new_record?

	mount_uploader :avatar, AvatarUploader

	belongs_to :specialization

	DEFAULT_TEXT = "Даний розділ ще не є заповнений інформацією!"

	def check_defaults 
		self.child_info ||= DEFAULT_TEXT
		self.instructor_info ||= DEFAULT_TEXT
	end

end
