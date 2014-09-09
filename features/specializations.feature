Feature: Specialization management

	Scenario: Main page without specializations
		Given I visit main page
		When there is no specializations
		Then I should not see any specialization
		And I should see "Спецпластування"

	Scenario: Main page with 3 specializations

	Scenario: Main page - images of specializations

	Scenario: Main page - default images for specializations

	Scenario: Admin creation of specialization

	Scenario: Admin creation of specialization - validations