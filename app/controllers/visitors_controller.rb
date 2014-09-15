class VisitorsController < ApplicationController

	def index		
		@specializations = Specialization.all
	end
end
