class Specdatum < ActiveRecord::Base
  include Bootsy::Container
  
  mount_uploader :file, FileUploader
  
	belongs_to :specialization

	validates :gen_info, presence: true, length: { minimum: 25 }
	validates :proby, presence: true, length: { minimum: 25 }
	validates :activity, presence: true, length: { minimum: 25 }
	validates :provid, presence: true, length: { minimum: 25 }
	validates :specialization_id, presence: true 
	
end
