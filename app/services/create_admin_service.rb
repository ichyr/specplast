class CreateAdminService
  def call
    user = User.new
    user.name = "TestUser"
    user.email = Rails.application.secrets.admin_email
    user.password = Rails.application.secrets.admin_password
    user.password_confirmation = Rails.application.secrets.admin_password
    user.change_role :admin
    user.save
    user
  end

  def call_custom email, password, role
  	user = User.new
    user.name = "TestUser"
    user.email = email
    user.password = password
    user.password_confirmation = password
    user.change_role role
    user.save
    user
  end

  INSTRUCTOR_NAMES = ["Петро", "Павло", "Семен", "Василь", "Христина", "Іван",
    "Ігор", "Тарас", "Максим", "Оксана", "Марина", "Тетяна", "Наталя", "Марія",
    "Ліда"]

  CITIES = ["Львів", "Станіслав", "Чернівці", "Рівне", "Київ", "Дніпропетровськ",
    "Запоріжжя", "Миколаїв", "Тернопіль", "Луцьк", "Харків", "Лкганськ", "Маріуполь"]

  REGIONS = ["Львівська", "Волинська", "Тернопільська", "Миколаївська", "Київська",
    "Івано-Франківська", "Закарпатська", "Дніпропетровська", "Луганська"]

  def call_instruktor email, password, role, vmilists = []
    user = User.new
    user.name = INSTRUCTOR_NAMES[rand(INSTRUCTOR_NAMES.count)]
    user.city = CITIES[rand(CITIES.count)]
    user.region = REGIONS[rand(REGIONS.count)]
    user.email = email
    user.password = password
    user.password_confirmation = password
    user.change_role role
    user.vmilists = vmilists
    user.save
    user
  end

  def call_moderator_create email, password, specialization
    user = User.new
    user.name = "TestUser"
    user.email = email
    user.password = password
    user.password_confirmation = password
    user.specialization = specialization
    user.role = :moderator
    user.save
    user
  end

end
