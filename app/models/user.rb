class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader


  # mount_uploaders :documents, DocumentUploader
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, :allow_destroy => true,
    reject_if: proc { |attributes| attributes['file'].blank? }
                                

  
  # :user role stands for instructor
  STATUSES = [:instruktor, :moderator, :admin]
  enum role: STATUSES
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :specialization

  validates :specialization_id, presence:true, 
            allow_nil: false, if: :is_moderator
  validates :name, presence: true, length: { minimum: 4}
  validates :role,  inclusion: { in: User.roles.keys }
  validates :email, uniqueness: {case_sensitive: false}


  has_many :qualifications, dependent: :destroy
  has_many :vmilists, through: :qualifications

  has_many :registries

  attr_reader :vmilist_token

  def vmilist_token=(ids)
    self.vmilist_ids = ids.split(",")
  end

  def is_moderator
    self.role.to_s == "moderator"
  end
 
  def set_default_role
    change_role :instruktor
  end

  def change_role role
    self.role = role
  end

  def self.gender_attributes_for_select
    roles.map do |role, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.roles.#{role}"), role]
    end
  end

  # unique list of cities of instruktors
  def self.get_cities_list
    User.select("distinct city")
        .where("city != ''")
        .map {|a| a.city}.sort
  end

  # unique list of cities of instruktors
  def self.get_regions_list
    User.select("distinct region")
        .where("region != ''")
        .map {|a| a.region}.sort
  end
end
