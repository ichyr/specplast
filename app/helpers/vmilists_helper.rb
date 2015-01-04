module VmilistsHelper
	def decorate_set instruktor
		# here the first link_to doesn't render the first symbol
		result = ""
		instruktor.qualifications.each { |qualification|
			vmilist = qualification.vmilist
			if qualification.confirmed == APPROVED
				result += link_to vmilist.name, vmilist, class: 'btn btn-xs btn-success'
			else 
				result += link_to vmilist.name, vmilist, class: 'btn btn-xs btn-warning'
			end

			result += "\n"
		}
		result
	end
end
