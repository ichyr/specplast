module GeneralInfosHelper
	def last_updated_at specdatum
		result = I18n.t("layout.specialization.information_last_updated")
		result += I18n.l(specdatum.updated_at, format: "%d %B %Y ")
	end
end
