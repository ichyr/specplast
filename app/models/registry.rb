class Registry < ActiveRecord::Base
	belongs_to :vmilist
	belongs_to :instruktor, class_name: "User"
	belongs_to :rank
end
