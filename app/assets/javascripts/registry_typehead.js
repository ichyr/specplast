$(document).ready(function() {
	var form = $('#new_registry');

	var instruktorIdInput = form.find('#registry_instruktor_id');
	var vmilistIdInput = form.find('#registry_vmilist_id');

	var instruktorInput = form.find('#registry_instruktor');
	var vmilistInput = form.find('#registry_vmilist');

	instruktorInput.prop('disabled', true);

	vmilistInput.autocomplete({
		search: function(event, ui) {
			instruktorInput.prop('disabled', true);
			vmilistIdInput.val('');
			instruktorInput.val('');
			instruktorIdInput.val('');
		},
		change: function(event, ui) {
			if (!vmilistInput.val()) {
				instruktorInput.prop('disabled', true);
				vmilistIdInput.val('');
				instruktorInput.val('');
				instruktorIdInput.val('');
			}
		},
		select: function(event, ui) {
			console.log('Select');
			vmilistIdInput.val(ui.item.vmilist_id);
			instruktorInput.prop('disabled', false);
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
	});

	instruktorInput.autocomplete({
		search: function(event, ui) {
			instruktorIdInput.val('');
		},
		change: function(event, ui) {
			if (!instruktorInput.val()) {
				instruktorIdInput.val('');
			}
		},
		select: function(event, ui) {
			instruktorIdInput.val(ui.item.user_id);
		},
		source: function(request, response) {
			var query = request.term;
			var vmilistId = vmilistIdInput.val();
			var url = '/registries/autocomplete_instruktor_name?q=' + query;
			url += '&vmilist_id=' + vmilistId;
			$.getJSON(url, function(data) {
				data = data.map(function(item) {
					return {
						user_id: item[0],
						value: item[1]
					}
				});
				response(data);
			})
		}
	})
});