class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.admin!
      end
  end

  def call_custom email, password, admin
  	user = User.find_or_create_by!(email: email) do |user|
        user.password = password
        user.password_confirmation = password

        user.admin! if admin
      end
  end
end
