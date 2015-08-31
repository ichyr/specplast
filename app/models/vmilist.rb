class Vmilist < ActiveRecord::Base
  include Bootsy::Container

  mount_uploader :avatar, AvatarUploader

  after_initialize :check_defaults, :if => :new_record?

  belongs_to :specialization

  has_many :qualifications, dependent: :destroy
  has_many :users, through: :qualifications

  validates :name, presence: true, 
                   length: { minimum: 4},
                   uniqueness: {case_sensitive: false}
  validates :child_info, presence: true, 
                         length: { minimum: 25 }
  validates :instructor_info, presence: true, 
                         length: { minimum: 25 }
  validates :specialization_id, presence: true 
  validates :name, uniqueness: { case_sensitive: false }

  def check_defaults 
    self.child_info ||= VMILIST_REQUIREMENTS_DEFAULT_TEXT
    self.instructor_info ||= VMILIST_REQUIREMENTS_DEFAULT_TEXT
    self.status ||= false
  end

end
