class Registry < ActiveRecord::Base
	belongs_to :vmilist
	belongs_to :user
	belongs_to :rank
end
