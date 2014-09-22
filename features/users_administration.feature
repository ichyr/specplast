Feature: Administrator can manage list of users

	Administrator can see list of instruktors
	Administrator can see list of administrators
	Administrator can see list of moderators
	Administrator can change user status
	Administrator must assign moderator to specific specialization

	# Scenario Outline: Administrator can see list of <role>
	# 	Given I am logged as administrator
	#   And I am on user list page
	#   Then I see list of all <role>

	#   Example:
	#   |     role     |
	#   |  instruktors |
	#   |administrators|
	#   |  moderators  |

	# Scenario: Administrator can change user status
	#   Given I am logged as administrator
	#   And I am on user list page
	#   When I click on edit user A link
	#   And assign user A role of administrator
	#   And save changes
	#   Then user A must have role of an administrator
	  

	# Scenario Outline: Administrator must assign moderator to specific specialization
	#   Given I am logged as administrator
	#   And I am on user list page
	#   When I click on edit user A link
	#   And assign user A role of moderator
	#   And <state> check specialization
	#   Then error must flash
	#   And user role is not changed

	#   Example:
	#   |state|
	#   |     |
	#   | not |

