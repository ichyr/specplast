# Feature: Specialization management

# 	Scenario: Specialization creation must enable live preview of uploaded image
# 		Given I am logged in as administrator
# 		And there are no specializations
# 		When I visit specialization creation page
# 		And I set image to be uploaded
# 		Then thumb of this image must be loaded into creation page

# 	Scenario: Admin can create new specialization
# 	  Given I am logged in as administrator
# 	  And there are no specializations
# 		When I create new specialization
# 		Then I get notice
# 		And specialization is created

# 	Scenario: Moderator can not create new specialization
# 	  Given I am logged in as moderator
# 	  And there are no specializations
# 		When I create new specialization
# 		Then I get error message
# 		And specialization is not created

# 	Scenario: User can not create new specialization
# 	  Given I am logged in as user
# 	  And there are no specializations
# 		When I create new specialization
# 		Then I get error message
# 		And specialization is not created

# 	Scenario: Admin can delete a specialization
# 	  Given I am logged in as administrator
# 		And there is one specialization
# 		When I delete this specialization
# 		Then I get notice
# 		And specialization is deleted

# 	Scenario: Moderator can not delete a specialization
# 	  Given I am logged in as moderator
# 		And there is one specialization
# 		When I delete this specialization
# 		Then I get error message
# 		And specialization is not deleted

# 	Scenario: User can not delete a specialization
# 	  Given I am logged in as user
# 		And there is one specialization
# 		When I delete this specialization
# 		Then I get error message
# 		And specialization is not deleted

# 	Scenario: Specialization can be edited by any admin
# 	  Given I am logged in as administrator
# 		And there is one specialization
# 		When I edit this specialization
# 		And I save the changes
# 		Then I can see those changes in specialization
	
# 	Scenario: Specialization can be edited by moderator that can moderate it
# 		Given I am logged in as moderator
# 		And there is one specialization
# 		When I edit this specialization
# 		And I save the changes
# 		Then I can see those changes in specialization