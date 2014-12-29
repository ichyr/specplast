class CreateAdminService
  def call
    user = User.new
    user.name = "TestUser"
    user.email = Rails.application.secrets.admin_email
    user.password = Rails.application.secrets.admin_password
    user.password_confirmation = Rails.application.secrets.admin_password
    user.change_role :admin
    user.save
    user
  end

  def call_custom email, password, role
  	user = User.new
    user.name = "TestUser"
    user.email = email
    user.password = password
    user.password_confirmation = password
    user.change_role role
    user.save
    user
  end

  def call_instruktor email, password, role, vmilists = []
    user = User.new
    user.name = "TestUser"
    user.email = email
    user.password = password
    user.password_confirmation = password
    user.change_role role
    user.vmilists = vmilists
    user.save
    user
  end

  def call_moderator_create email, password, specialization
    user = User.new
    user.name = "TestUser"
    user.email = email
    user.password = password
    user.password_confirmation = password
    user.specialization = specialization
    user.role = :moderator
    user.save
    user
  end

end
