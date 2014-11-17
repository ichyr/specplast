class GeneralInfo < ActiveRecord::Base
	validate :key, presence: true
	validate :value, presence: true
end
