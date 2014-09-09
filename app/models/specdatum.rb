class Specdatum < ActiveRecord::Base
  mount_uploader :pologennya, FileUploader
	belongs_to :specialization
end
