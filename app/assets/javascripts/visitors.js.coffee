# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ajax_search_listeners_init = ->
  $(".visitors_vmilosti_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  $(".visitors_instructors_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  $(".instruktors-list .pagination a").click (e) ->
    e.preventDefault()
    $.getScript @href
    false

  return

$(document).on "ready page:update", ajax_search_listeners_init