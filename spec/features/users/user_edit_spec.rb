include Warden::Test::Helpers
Warden.test_mode!

# Feature: User edit
#   As a user
#   I want to edit my user profile
#   So I can change my email address
feature 'User edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User changes email address
  #   Given I am signed in
  #   When I change my email address
  #   Then I see an account updated message
  scenario 'user changes email address' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path(user)
    fill_in I18n.t("devise.user.email"), :with => 'newemail@example.com'
    fill_in I18n.t("devise.user.current_password"), :with => user.password
    click_button I18n.t("devise.buttons.update")
    expect(page).to have_content I18n.t 'devise.registrations.user.updated'
  end

  # Scenario: User cannot edit another user's profile
  #   Given I am signed in
  #   When I try to edit another user's profile
  #   Then I see my own 'edit profile' page
  scenario "user cannot cannot edit another user's profile", :me do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user, email: 'other@example.com')
    login_as(me, :scope => :user)
    visit edit_user_registration_path(other)
    expect(page).to have_content I18n.t "devise.user.edit"
    expect(page).to have_field(I18n.t("devise.user.email"), with: me.email)
  end

end
