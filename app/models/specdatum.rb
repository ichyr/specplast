class Specdatum < ActiveRecord::Base
  mount_uploader :pologennja, FileUploader
	belongs_to :specialization
end
