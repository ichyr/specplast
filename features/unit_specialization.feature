Feature: Specialization unit properties

	Scenario: Specialization avatar must have class AvatarUploader
		Given I have new specialization object
		Then it's avatar's is related to CarrierWave

	Scenario: Specialization has support data in :specdata
		Then it should reference one specdatum

	Scenario: Specialziation references vmilists via :vmilists
  	Then it should reference many vmilists
	
	Scenario: Specialization must name,  avatar, moderators
		Given I have new specialization object
		Then it should respond to messages name, avatar, moderators