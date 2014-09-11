class VmilistService

  def create specialization
    Vmilist.create! name: "Тест", specialization: specialization
  end

end
