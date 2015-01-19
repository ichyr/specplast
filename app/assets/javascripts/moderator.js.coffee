# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->

  $(".moderator_vmilosti_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  $(".not_approved_qualifications_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  $(".no_info_qualifications_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  $(".approved_qualifications_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  return

$(document).on "ready page:update", ->

  $(".qualifications_manage a.btn").click (e) ->
    $(this).attr("data-pending", "true")
    e.preventDefault()
    $.get(@href).done(->
      $.getScript location
      return
    ).fail(->
      alert "Error occured!"
      return
    )
    false

  $(".qualifications-list .pagination a").click (e) ->
    e.preventDefault()
    $.getScript @href
    false

  return
