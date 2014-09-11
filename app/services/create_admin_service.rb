class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.change_role :admin
      end
  end

  def call_custom email, password, role
  	user = User.find_or_create_by!(email: email) do |user|
      user.password = password
      user.password_confirmation = password
      user.change_role role
    end
  end

  def call_moderator_create email, password, specialization
    user = User.find_or_create_by!(email: email) do |user|
      user.password = password
      user.password_confirmation = password
      user.change_role :moderator
      user.specialization = specialization
    end
  end

end
