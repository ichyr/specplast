def specialization_url spec
	url_for(controller: 'specializations', action: 'show', id: spec.id,
		      only_path: true)
end