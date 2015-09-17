require 'rails_helper'

RSpec.describe SpecializationsController, :type => :controller do
	
	it "should redirect to root when #index" do
		get :index
		expect(response).to redirect_to "/"
		expect(response).to have_http_status(302)
	end

	it "should render :show template" do
		@specialization = FactoryGirl.create(:specialization)
		get :show, id: @specialization.id

    expect(response).to render_template :show
	end

	it "should return current specialization" do
		@specialization = FactoryGirl.create(:specialization)
		get :show, id: @specialization.id
    expect(assigns[:specialization]).to eq(@specialization)
	end
end