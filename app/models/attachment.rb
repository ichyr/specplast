class Attachment < ActiveRecord::Base
  mount_uploader :file, DocumentUploader

  belongs_to :attachable, :polymorphic => true
end