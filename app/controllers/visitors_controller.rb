class VisitorsController < ApplicationController

	def index		
		@specializations = Specialization.all
	end

	def activities
		@specializations = Specialization.all
	end

	def vmilosti
		@specializations = Specialization.all
	end

	def instructors
		@specializations = Specialization.all
	end

	def provid
		@specializations = Specialization.all
	end

	def proby
		@specializations = Specialization.all
	end

	def bulava
		@bulava = "Text to be included"
	end

	def api
		@specialization = Specialization.find(param[:id])
	end

end
