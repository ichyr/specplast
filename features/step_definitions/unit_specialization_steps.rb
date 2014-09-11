Given(/^I have new specialization object$/) do
  @specialization = SpecializationService.new.create
end

Then(/^it should respond to messages (.*?)$/) do |methods|
	methods.split(", ").each { |method| 
		expect(@specialization).to respond_to(method.to_s)
	}  
end

Then(/^it should reference many vmilists$/) do
  SpecializationService.new.create.should have_many :vmilists
end

Then(/^it should reference one specdatum$/) do
  SpecializationService.new.create.should have_one :specdatum
end
