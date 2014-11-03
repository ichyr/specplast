# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do

  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'user signs out successfully' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_selector("[href~='#{destroy_user_session_path}']")
    page.first("[href~='#{destroy_user_session_path}']").click
    expect(page).to have_selector(".glyphicon-log-in")
  end

end


