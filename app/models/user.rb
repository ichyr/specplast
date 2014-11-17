class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  
  # :user role stands for instructor
  enum role: [:instruktor, :moderator, :admin]
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

  def is_moderator
    self.role.to_s == "moderator"
  end
 
  def set_default_role
    change_role :instruktor
  end

  def change_role role
    self.role = role
  end
end
