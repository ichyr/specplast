Given(/^I have new specialization object$/) do
  @specialization = SpecializationService.new.create
end

Then(/^it should respond to messages (.*?)$/) do |methods|
	methods.split(", ").each { |method| 
		expect(@specialization).to respond_to(method.to_s)
	}  
end
