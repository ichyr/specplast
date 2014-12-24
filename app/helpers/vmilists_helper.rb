module VmilistsHelper
	def decorate_set vmilists
		result = "<"
		vmilists.each { |vmilist|
			result += link_to vmilist.name, vmilist, class: 'btn-xs'
			result += "\n"
		}
		result
	end
end
