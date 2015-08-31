class VisitorsController < ApplicationController

	# for access in views
	helper_method :sort_column, :sort_direction

	def index		
		@specializations = Specialization.order(name: :asc)
	end

	def activities
		@specializations = Specialization.order(name: :asc)
	end

	def vmilosti
		@vmilists = Vmilist.select(:id, :name, :avatar, :status)
											 .where("lower(name) like ?", "%#{search_query}%")
											 .order(name: :asc)
			                 .paginate(:page => params[:page], :per_page => 12)
	end

	def instructors
		@instruktors = User.select(:id, :name, :avatar, :city, :region)
											 .includes(:vmilists)
											 .where("lower(name) like ?", "%#{search_query}%")
											 .order(sort_column + " " + sort_direction)
											 .paginate(:page => params[:page], :per_page => 10)
		puts "Listing"
		puts
		puts params.inspect
		puts
		puts "Listing"
	end

	def provid
		@specializations = Specialization.select(:id, :name)
																		 .includes(:specdatum)
																		 .order(name: :asc)

	end

	def proby
		@specializations = Specialization.select(:id, :name)
																		 .includes(:specdatum)
																		 .order(name: :asc)
	end

	def bulava
		@bulava_info = GeneralInfo.where("key = ?", "bulava")
	end

	def api
		@specialization = Specialization.find(params[:id])

		@vmilists = Vmilist.where('lower(vmilists.name) LIKE ? and vmilists.specialization_id = ?',
											 	      "%#{search_query}%", "#{params[:id]}")
			.limit(10)
	end

  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_query
  	params[:search].downcase if params[:search]
  end

end
