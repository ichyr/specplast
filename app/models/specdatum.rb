class Specdatum < ActiveRecord::Base
  mount_uploader :file, FileUploader
	belongs_to :specialization
end
