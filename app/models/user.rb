class User < ActiveRecord::Base
  # :user role stands for instructor
  enum role: [:instruktor, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :specialization

  validates :specialization_id, presence: true, if: :is_moderator

  def is_moderator
    :role.to_s == "moderator"
  end
 
  def set_default_role
    change_role :instruktor
  end

  def change_role role
    self.role = role
    self.specialization = nil if role != :moderator
  end
end
