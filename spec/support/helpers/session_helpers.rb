module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit new_user_registration_path
      fill_in I18n.t("devise.user.name"), with: password
      fill_in I18n.t("devise.user.email"), with: email
      fill_in I18n.t("devise.user.password"), with: password
      fill_in I18n.t("devise.user.password_confirmation"), :with => confirmation
      click_button I18n.t("devise.user.sign_up")
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in I18n.t("devise.user.email"), with: email
      fill_in I18n.t("devise.user.password"), with: password
      click_button I18n.t("devise.user.sign_in_button")
    end
  end
end
