# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, sign in, or sign up
feature 'Navigation links', :devise do

  # Scenario: View navigation links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "sign in," and "sign up"
  scenario 'view navigation links' do
    visit root_path

    expect(page).to have_content I18n.t 'layout.sign_in'
    expect(page).to have_content I18n.t "layout.home_page"
    expect(page).to have_content I18n.t "layout.vmilosti_page"
    expect(page).to have_content I18n.t "layout.activities_page"
    expect(page).to have_content I18n.t "layout.proby_page"
    expect(page).to have_content I18n.t "layout.instruktory_page"
    expect(page).to have_content I18n.t "layout.provid_page"
    expect(page).to have_content I18n.t "layout.bulava_page"
  end

end
