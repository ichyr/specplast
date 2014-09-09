# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# User creation

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

USER_NAMES = ["qwe", "asd"]
USER_PASSWORD = "changeme"
USER_ADMIN = [false, true]

0.upto(USER_NAMES.length - 1 ) { |index|
	p "index ->  #{index}"
	user = CreateAdminService.new.call_custom USER_NAMES[index].to_s + "@example.com",
																		 				USER_PASSWORD,
																		 				USER_ADMIN[index]
}


# Seed Specializations

SPECIALIZATIONS_COUNT = 3
SPECIALIZATION_NAMES = [ "Кінна", "Військова", "Мандрівнича", "Спортивна",
												 "Морська", "Летунська", "Мистецька"]

SPECIALIZATIONS_COUNT.times {
  Specialization.create name: SPECIALIZATION_NAMES.sample
}