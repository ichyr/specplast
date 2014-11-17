class Vmilist < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader

	after_initialize :check_defaults, :if => :new_record?

	belongs_to :specialization

	validates :name, presence: { message: "name can't be blank"}, 
	                 length: { minimum: 4, message: "message lenght" }
	validates :child_info, presence: true, 
	                       length: { minimum: 25, message: " child info length!!! " }
	validates :instructor_info, presence: true, 
	                       length: { minimum: 25, message: " instruktor info length!!! " }
	validates :specialization_id, presence: { message: " specialization presence" } 
	validates :name, uniqueness: { case_sensitive: false, 
																	message: "Vmilist name is already taken!" }



	DEFAULT_TEXT = "Даний розділ ще не є заповнений інформацією!"

	def check_defaults 
		self.child_info ||= DEFAULT_TEXT
		self.instructor_info ||= DEFAULT_TEXT
	end

end
