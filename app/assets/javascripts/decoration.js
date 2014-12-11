function decorate_vmilists() {
	$(".decorate-array").each(function(){
		var el = $(this);
		var text = el.text();
		// delete [ and ] synbols
		text = text.slice(1,-1);
		
		// delete all double qoutes
		while (text.indexOf("\"") >= 0) {
			text = text.replace("\"", "");
		};

		// split into array of names
		var tags = text.split(", ");

		var result = ""
		// enclose every tag into span
		tags.forEach(function(a){
			result += "<span class='btn btn-xs btn-default'>";
			result += a;
			result += "</span>\n";
		});

		// replace original mess with decorated
		el.html(result);
	})
}

$(document).ready(function(){ decorate_vmilists(); })
$(document).on("page:load", function(){ decorate_vmilists(); })