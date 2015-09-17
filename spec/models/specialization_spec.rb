require 'rails_helper'

RSpec.describe Specialization, :type => :model do

  before(:each) do
    @specialization = FactoryGirl.build(:specialization)
  end

  it "should respond to avatar message" do
    expect(@specialization).to respond_to(:avatar)
  end

  it "avatar should be of AvatarUploader class" do
    expect(@specialization.avatar).to be_instance_of AvatarUploader
  end

  context " validations :" do
    it "name should not be valid with length less then 4 characters" do
      @specialization.name = "wow"
      expect(@specialization.valid?).to eq(false)
    end

    it "name should be valid with length of 4 characters" do
      @specialization.name = "yeah"
      expect(@specialization.valid?).to eq(true)
    end

    it "should not be valid with absent name" do
      @specialization.name = ""
      expect(@specialization.valid?).to eq(false)
    end

    it "should not be valid with name made with space signs" do
      @specialization.name = "     "
      expect(@specialization.valid?).to eq(false)
    end
  end

  context "have associations" do
    it "should has one specdatum associated" do
      specialization = Specialization.reflect_on_association(:specdatum)
      expect(specialization.macro).to eq(:has_one)
    end

    it "should has_many moderators associated" do
      specialization = Specialization.reflect_on_association(:moderators)
      expect(specialization.macro).to eq(:has_many)
    end

    it "should has_many vmilists associated" do
      specialization = Specialization.reflect_on_association(:vmilists)
      expect(specialization.macro).to eq(:has_many)
    end
    
  end

  it "should accept nested attributes for " do
    specialization = FactoryGirl.build(:specialization)
    expect(specialization).to accept_nested_attributes_for(:specdatum)
  end

end
