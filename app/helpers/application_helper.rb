module ApplicationHelper
	def decorate_vmilist_with_state(vmilist)
		result = "<div>"
			result += "<img src=" + vmilist.avatar.url(:thumb) + ">" 
				if vmilist.status == 0
					result += "<span class='glyphicon glyphicon-hourglass overlay status-pending'> </span>" 
				else
					result += "<span class='glyphicon glyphicon-ok-sign overlay status-accepted'> </span>" 
				end
			result += "</img>" 
		result += "</div>"

		result
	end

	def decorate_specialization_with_state(specialization)
		result = "<div>"
			result += "<img src=" + specialization.avatar.url(:thumb) + ">" 
				if specialization.status == 0
					result += "<span class='glyphicon glyphicon-hourglass overlay status-pending'> </span>" 
				else
					result += "<span class='glyphicon glyphicon-ok-sign overlay status-accepted'> </span>" 
				end
			result += "</img>" 
		result += "</div>"

		result
	end
end
