class Specdatum < ActiveRecord::Base
  include Bootsy::Container
  
  mount_uploader :file, FileUploader
  
	belongs_to :specialization

	# lenght: => 10
end
