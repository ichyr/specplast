# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # Search form.
  $(".moderator_vmilosti_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  return