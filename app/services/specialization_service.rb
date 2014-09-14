class SpecializationService

  def create
    Specialization.create! name: "Тест"
  end

  def create_name name
  	Specialization.create! name: name
  end

end
