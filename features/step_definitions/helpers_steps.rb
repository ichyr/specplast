def specialization_url spec
	url_for(controller: 'specializations', action: 'show', id: spec.id,
		      only_path: true)
end

def sign_up_with(email, password, confirmation)
  visit new_user_registration_path
  fill_in I18n.t("devise.user.name"), with: password
  fill_in I18n.t("devise.user.email"), with: email
  fill_in I18n.t("devise.user.password"), with: password
  fill_in I18n.t("devise.user.password_confirmation"), :with => confirmation
  click_button I18n.t("devise.user.sign_up")
end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in I18n.t("devise.user.email"), with: email
  fill_in I18n.t("devise.user.password"), with: password
  # sleep(inspection_time=5)
  click_button I18n.t("devise.user.sign_in_button")
end