# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  preview = $(".upload-preview img")
  $(".file").change (event) ->
    input = $(event.currentTarget)
    file = input[0].files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      image_base64 = e.target.result
      preview.attr "src", image_base64
      return

    reader.readAsDataURL file
    return

  return

# pagination and search in specializations/show view
$ ->
  $("#vmilists .pagination a").live "click", ->
    $.getScript @href
    false

  # Search form.
  $("#specialization_search").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false

  return
