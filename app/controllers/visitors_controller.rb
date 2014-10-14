class VisitorsController < ApplicationController

	def index		
		@specializations = Specialization.all
	end

	def activities
		@specializations_names = Specialization.select("name")
		@specdatum_activity = Specdatum.select("activity")
	end

	def vmilosti
		@specializations = Specialization.select("name")
	end

	def instructors
		@specializations_names = Specialization.select("name")
		@specdatum_activity = Specdatum.select("instructors")
	end

	def provid
		@specializations_names = Specialization.select("name")
		@specdatum_activity = Specdatum.select("provid")
	end

	def proby
		@specializations_names = Specialization.select("name")
		@specdatum_activity = Specdatum.select("proby")
	end

	def bulava
		@specializations_names = Specialization.select("name")
		@specdatum_activity = Specdatum.select("activity")
	end

end
