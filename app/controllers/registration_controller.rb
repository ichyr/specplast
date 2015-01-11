class RegistrationController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserMailer.new_registration(@user).deliver_now
    end
  end

end