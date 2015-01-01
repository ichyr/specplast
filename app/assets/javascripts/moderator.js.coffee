# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->

  $(".moderator_vmilosti_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false


  $(".qualifications_manage a").click (e) ->
    $(this).attr("data-pending", "true")
    e.preventDefault()
    $.get(@href).done(->
      temp = $('[data-pending="true"]')
      temp = temp.parent().parent()
      temp.remove()
      return
    ).fail(->
      alert "error"
      return
    )
    false

  return
