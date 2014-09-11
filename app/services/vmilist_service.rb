class VmilistService

  def create name, specialization
    Vmilist.create! name: name, specialization: specialization
  end

end
