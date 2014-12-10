class Vmilist < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader

	after_initialize :check_defaults, :if => :new_record?

	belongs_to :specialization

	has_many :qualifications
  has_many :users, through: :qualifications

	validates :name, presence: true, 
	                 length: { minimum: 4}
	validates :child_info, presence: true, 
	                       length: { minimum: 25 }
	validates :instructor_info, presence: true, 
	                       length: { minimum: 25 }
	validates :specialization_id, presence: true 
	validates :name, uniqueness: { case_sensitive: false }

	DEFAULT_TEXT = "Даний розділ ще не є заповнений інформацією!"

	def check_defaults 
		self.child_info ||= DEFAULT_TEXT
		self.instructor_info ||= DEFAULT_TEXT
	end

end
