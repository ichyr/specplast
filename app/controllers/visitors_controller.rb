class VisitorsController < ApplicationController

	def index		
		@specializations = Specialization.all
	end

	def activities
		@specializations = Specialization.all
	end

	def vmilosti
		@vmilists = Vmilist.where("name like ?", "%#{params[:search]}%")
			                  .paginate(:page => params[:page], :per_page => 12)
	end

	def instructors
		@instruktors = User.where("name like ?", "%#{params[:search]}%")
												.paginate(:page => params[:page], :per_page => 10)
	end

	def provid
		@specializations = Specialization.all
	end

	def proby
		@specializations = Specialization.all
	end

	def bulava
		@bulava_info = GeneralInfo.where("key = ?", "bulava")
	end

	def api
		@specialization = Specialization.find(params[:id])
		@vmilists = @specialization.vmilists.select do |vmilist|
			vmilist.name.include?(params[:search])
		end
	end

end
