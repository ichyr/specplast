Then(/^I should see title in header$/) do
  expect(page).to have_content(I18n.t "layout.title")
end

Then(/^I should see navigation links in header$/) do
	keys = [ "layout.home_page",
		"layout.vmilosti_page",
		"layout.activities_page",
		"layout.proby_page",
		"layout.instruktory_page",
		"layout.provid_page",
		"layout.bulava_page" ]
	keys.each { |key| 
		expect(page).to have_link I18n.t key
	}
end

Then(/^I should see login link in header$/) do
  expect(page).to have_link I18n.t("layout.sign_in"), new_user_session_path
end

When(/^I sign in as a user$/) do
	test_email = "test@example.com"
	test_password = "password123"
  CreateAdminService.new.call_custom test_email,
  																	 test_password, :instruktor
  sign_in_with test_email, test_password
  visit "/"
end

Then(/^I should see logout link in header$/) do
  expect(page).to have_link I18n.t("layout.sign_out"), destroy_user_session_path
end
