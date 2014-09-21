def specialization_url spec
	url_for(controller: 'specializations', action: 'show', id: spec.id,
		      only_path: true)
end

# To I18n.t all labels
def sign_up_with email, password, confirmation
	visit new_user_registration_path
	fill_in "user_email", with: email
	fill_in "user_password", with: password
	fill_in "user_password_confirmation", :with => confirmation
	click_button I18n.t("devise.user.sign_up")
end

# To I18n.t all labels
def sign_in_with email, password
 	visit new_user_session_path
	fill_in "user_email", with: email
	fill_in "user_password", with: password
  click_button I18n.t("devise.user.sign_in")
end