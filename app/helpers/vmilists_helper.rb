module VmilistsHelper
	def decorate_set instruktor
		# here the first link_to doesn't render the first symbol
		result = ""
		instruktor.qualifications.each { |qualification|
			vmilist = qualification.vmilist
			if qualification.confirmed == APPROVED
				result += link_to vmilist.name, vmilist, class: 'btn btn-xs btn-success'
			else 
				result += link_to vmilist.name, vmilist, class: 'btn btn-xs btn-primary'
			end

			result += "\n"
		}
		result
	end

	def vmilist_status_decoder(status)
		key = VMILIST_STATUS.key(status)
		I18n.t("constants.vmilist_status.#{key}")
	end
end
