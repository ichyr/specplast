Feature: General header of the system

	Navigation links should point to correct locations

	@ignore
	Scenario: I must see system title 
		Given I see index page
		Then I should see title in header

	Scenario: I must see header navigation links
		Given I see index page
		Then I should see navigation links in header

	Scenario: I must see login link in header as a guest
		Given I see index page
		Then I should see login link in header

	Scenario: I must see logout link in header when logged in
		Given I see index page
		When I sign in as a user
		Then I should see logout link in header