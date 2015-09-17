module SpecializationsHelper

	def speciaization_status_decoder(status)
		key = SPECIALIZATION_STATUS.key(status)
		I18n.t("constants.specialization_status.#{key}")
	end
	
end
