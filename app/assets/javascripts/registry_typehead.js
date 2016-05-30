$(document).ready(function() {
		var form = $('#new_registry');
		var instruktorIdInput = $('#registry_instructor_id');
		var vmilistIdInput = $('#registry_vmilist_id');
		var instruktorInput = $('#new_registry #registry_instructor_name');
		var vmilistInput = $('#new_registry #registry_vmilist');
		vmilistInput.autocomplete({
			select: function(event, ui) {
				vmilistIdInput.val(ui.item.vmilist_id);
			},
			source: function(request, response) {
				var query = request.term;
				var url = '/registries/autocomplete_vmilist_name?q=' + query;
				$.getJSON(url, function(data) {
					data = data.map(function(item) {
						return {
							vmilist_id: item[0],
							value: item[1]							
						}
					});
					response(data);
				})
			}
		})
	});