class VisitorsController < ApplicationController
	NO_SPECIALIZATIONS_MSG = "В базі даних немає відомостей про жодну спеціалізацію"

	def index		
		@specializations = Specialization.all
		# flash[:notice] = NO_SPECIALIZATIONS_MSG if @specializations.count == 0
	end
end
