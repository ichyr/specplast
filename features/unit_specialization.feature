Feature: Specialization unit properties

	Default specialization avatar must be present is file system
	Default specialization avatar thumb must be present is file system
	Specialization without avatar must have defualt avatar present
	Specialization without avatar must have a default thumb avatar present
	Specialization can change it's name
	Specialization can change it's avatar
	Specialization has support data in :specdata

	Scenario Outline: Specialziation has vmilists list in :vmilists
  	Given I have new specialization object
  	When I assign <number> new vmilist to it
  	Then it should reference these <number> vmilists

  Examples:
    | number |
    |  12   |
    |  20   |
	
	Scenario: Specialization must name,  avatar, moderators
		Given I have new specialization object
		Then it should respond to messages name, avatar, moderators