Feature: Specialization unit properties

	Default specialization avatar must be present is file system

	Default specialization avatar thumb must be present is file system

	Specialization without avatar must have defualt avatar present

	Scenario: Specialization without avatar must have a default thumb avatar present
		Given I have new specialization object
		Then it's avatar's thumb should be "default_thumb.png"

	Scenario: Specialization has support data in :specdata
		Then it should reference one specdatum

	Scenario: Specialziation references vmilists via :vmilists
  	Then it should reference many vmilists
	
	Scenario: Specialization must name,  avatar, moderators
		Given I have new specialization object
		Then it should respond to messages name, avatar, moderators