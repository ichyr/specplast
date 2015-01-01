class Qualification < ActiveRecord::Base
	belongs_to :user
	belongs_to :vmilist

	after_initialize :set_default_confirmed, :if => :new_record?

	def set_confirmed value
		self.confirmed = value
	end

	private
	def set_default_confirmed
		set_confirmed "false"
	end
end
