require 'rails_helper'

RSpec.describe GeneralInfo, :type => :model do

	before :each do
		general_info = FactoryGirl.build(:general_info)
	end
	
  it "should have present key" do
  	expect(general_info).to validate_presence_of(:key)
  end

  it "should have present value" do
  	expect(general_info).to validate_presence_of(:value)
  end
end
