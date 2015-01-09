class VisitorsController < ApplicationController

	def index		
		@specializations = Specialization.all
	end

	def activities
		@specializations = Specialization.all
	end

	def vmilosti
		@vmilists = Vmilist.select(:id, :name, :avatar)
											 .where("name like ?", "%#{params[:search]}%")
			                 .paginate(:page => params[:page], :per_page => 12)
	end

	def instructors
		@instruktors = User.select(:id, :name, :avatar, :city, :region)
											 .includes(:vmilists)
											 .where("name like ?", "%#{params[:search]}%")
											 .paginate(:page => params[:page], :per_page => 10)
	end

	def provid
		@specializations = Specialization.select(:id, :name)
																		 .includes(:specdatum)
																		 .all

	end

	def proby
		@specializations = Specialization.select(:id, :name)
																		 .includes(:specdatum)
																		 .all
	end

	def bulava
		@bulava_info = GeneralInfo.where("key = ?", "bulava")
	end

	def api
		@specialization = Specialization.find(params[:id])

		@vmilists = Vmilist.where('vmilists.name LIKE ? and vmilists.specialization_id = ?',
											 	      "%#{params[:search]}%", "#{params[:id]}")
			.limit(10)
	end

end
