Feature: General view of index page

	@ignore
	Scenario: I must see header
		Given I see index page
		Then I should see "Спеціалізаційне пластування"

	@ignore
	Scenario: I must see footer
		Given I see index page
		Then I should see "КБ УПЮ"

	@ignore
	Scenario: I must see list of specializations
		Given I have 10 specializations in database
		And I see index page
		Then I should see 10 links to specializations

	@ignore
	Scenario: I must see avatars of specializations
		Given I have 10 specializations in database
		And I see index page
		Then I should see 10 avatars to specializations

	@ignore
	Scenario: I must see page with relevant links
		Given I have 10 specializations in database
		And I see index page
		When I click on specific link
		Then I should see corresponding specialization page

	@ignore
	Scenario: I must see page with avatar-links 
		Given I have 10 specializations in database
		And I see index page
		When I click on specific avatar
		Then I should see corresponding specialization page

	@ignore
	Scenario: I must see information message if there are no any specializations
		Given I have no specializations in bd
		And I see index page
		Then I should see message ""