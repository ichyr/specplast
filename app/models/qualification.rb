class Qualification < ActiveRecord::Base
	belongs_to :user
	belongs_to :vmilist

	after_initialize :set_default_confirmed, :if => :new_record?

	private
	def set_default_confirmed
		self.confirmed = false
	end
end
