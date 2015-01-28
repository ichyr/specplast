require 'rails_helper'

RSpec.describe Qualification, :type => :model do

  before(:each) do
    @qualification = FactoryGirl.build(:qualification)
  end

  it 'should belong to user' do 
  	expect(@qualification).to belong_to(:user)
  end 

  it 'should belong to vmilist' do
  	expect(@qualification).to belong_to(:vmilist)
  end

  it 'should set confirmed value as in supplied argument' do
    CONSTANT = 5
    @qualification.set_confirmed CONSTANT
    expect(@qualification.confirmed).to eq(CONSTANT)
  end

  it 'should set confirmed field  to NEEDS_APPROVE after \
   initialization of new record' do
    @qualification = Qualification.new
    expect(@qualification.confirmed).to eq(NEEDS_APPROVE)
  end
end
