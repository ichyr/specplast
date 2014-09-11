class User < ActiveRecord::Base
  # :user role stands for instructor
  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :specialization

  def set_default_role
    change_role :user
  end

  def change_role role
    self.role = role
    self.specialization = nil if role != :moderator
  end
end
