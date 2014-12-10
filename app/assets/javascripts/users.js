// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  $("#user_vmilists").tokenInput("/vmilists/preview.json", {
    crossDomain: false,
    prePopulate: $("#user_vmilists").data("pre"),
    theme: "facebook"
  });
});