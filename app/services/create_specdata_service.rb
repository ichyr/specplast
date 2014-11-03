class CreateSpecdataService

	GENERAL_INFO = <<-DOCS
	  This is a block of General information
	DOCS
  
  def call text, spec_id
    data = Specdatum.find_or_create_by!(specialization_id: spec_id) do |data|
    	data.gen_info = GENERAL_INFO
      data.proby = text
      data.activity = text
      data.provid = text
      # data.pologennya = ".."
      end
  end

end
