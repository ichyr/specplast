# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


function ajax_search_listeners_init() {
  $(".visitors_vmilosti_search").submit(function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
  $(".visitors_instructors_search").submit(function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });

  $(".instruktors-list .pagination li a").click(function(e) {
    $.getScript(this.href);
    e.preventDefaults;
    return false;
  });
};

$(document).ready(function(){ ajax_search_listeners_init(); })
$(document).on("page:load", function(){ ajax_search_listeners_init(); })