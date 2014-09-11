# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# User creation

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

roles = User.roles.keys
roles.delete("moderator")

USER_NAMES = roles
USER_PASSWORD = "changeme"
USER_ROLES = roles

0.upto(USER_NAMES.length - 1 ) { |index|
	user = CreateAdminService.new.call_custom USER_NAMES[index].to_s + "@example.com",
																		 				USER_PASSWORD,
																		 				USER_ROLES[index]
}


# This will seed specializations, relevant specdata and moderators for given
# specialization

# Seed Specializations

SPECIALIZATIONS_COUNT = 5
SPECIALIZATION_NAMES = [ "Кінна", "Військова", "Мандрівнича", "Спортивна",
												 "Морська", "Летунська", "Мистецька"]

# Seed Specdatum
SPECDATUM_TEXT = "Будь ласка надайте актуальні інформацію по цьому напрямку"

0.upto(SPECIALIZATIONS_COUNT - 1) { |index|
  Specialization.create name: SPECIALIZATION_NAMES[index]
}

Specialization.all.each { |spec| 
  CreateSpecdataService.new.call SPECDATUM_TEXT, spec.id
  CreateAdminService.new.call_moderator_create "s#{spec.id}@example.com",
  																						 USER_PASSWORD,
  																						 spec
}