class Qualification < ActiveRecord::Base
	belongs_to :user
	belongs_to :vmilist
end
