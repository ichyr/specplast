module VmilistsHelper
	def decorate_set vmilists
		# here the first link_to doesn't render the first symbol
		result = "<"
		vmilists.each { |vmilist|
			result += link_to vmilist.name, vmilist, class: 'btn-xs'
			result += "\n"
		}
		result
	end
end
