$(document).ready(function(){
	$('#new_registry #registry_instruktor_id').typeahead(null, {
    name: 'instrukror',
    display: 'value',
    async: true,
    source: function(q, cb, asyncCb) {
			var url = '/registries/autocomplete_instruktor_name?vmilist_id=1&q=' + q;
	    $.getJSON(url, function(data) {
	      cb(data);
	    });
	  }
  })
})