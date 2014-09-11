Given(/^I have new specialization object$/) do
  @specialization = SpecializationService.new.create
end

Then(/^it should respond to messages (.*?)$/) do |methods|
	methods.split(", ").each { |method| 
		expect(@specialization).to respond_to(method.to_s)
	}  
end

When(/^I assign (\d+) new vmilist to it$/) do |arg1|
  
end

Then(/^it should reference these (\d+) vmilists$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

