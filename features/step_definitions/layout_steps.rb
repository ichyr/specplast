Then(/^I should see title in header$/) do
  # expect(page).to have_content(I18n.t "layout.title")
end

Then(/^I should see navigation links in header$/) do
	# keys = [ ["layout.home_page", url_for "root"],
	# 	["layout.vmilosti_page", url_for "root"],
	# 	["layout.activities_page", url_for "root"],
	# 	["layout.proby_page", url_for "root"],
	# 	["layout.instruktory_page", url_for "root"],
	# 	["layout.provid_page", url_for "root"],
	# 	["layout.bulava_page", url_for "root"] ]
	# keys.each { |key| 
	# 	expect(page).to have_content I18n.t(key[0])
	# 	expect(page).to have_link key[1]
	# }
end

Then(/^I should see login link in header$/) do
  # expect(page).to have_content I18n.t("layout.sign_in")
  # expect(page).to have_link new_user_session_path
end

When(/^I sign in as a user$/) do
  # sign_up_with "test@example.com", "password123", "password123"
  # sign_in_with "test@example.com", "password123"
  # visit "/"
end

Then(/^I should see logout link in header$/) do
  # expect(page).to have_content I18n.t("layout.sign_in")
  # expect(page).to have_link destroy_user_session_path
end
