class Registry < ActiveRecord::Base
	belongs_to :vmilist
	belongs_to :instruktor, class_name: "User"
	belongs_to :rank

	attr_accessor :instructor_details

	validates :name, :surname, :dob, :email, :troop, :group, :city, presence: true
	validates :region, :vmilist_id, :comment, :achievement_date, presence: true
	validates :place, :activity, :instruktor_id, :photo_url, presence: true

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
