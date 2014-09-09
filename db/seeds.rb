# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# User creation

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

USER_NAMES = ["qwe"]
USER_PASSWORDS = ["qwe"]
USER_ADMIN = [false]

0.upto(USER_NAMES.length) { |index|
	user = CreateAdminService.new.create_custom USER_NAMES[index],
																		 					USER_PASSWORDS[index],
																		 					USER_ADMIN[index]
}


# Seed Specializations

SPECIALIZATIONS_COUNT = 3
SPECIALIZATION_NAMES = [ "Кінна", "Військова", "Мандрівнича", "Спортивна",
												 "Морська", "Летунська", "Мистецька"]

SPECIALIZATIONS_COUNT.times {
  Specialization.create name: SPECIALIZATION_NAMES.sample
}