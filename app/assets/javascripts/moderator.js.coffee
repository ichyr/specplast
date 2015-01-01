# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update_qualification = (entity_id, new_state) ->
  event.preventDefault()
  console.log "Entity = " + entity_id + ", to: " + new_state
  false

$(document).on "ready page:update", ->

  $(".moderator_vmilosti_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  return

