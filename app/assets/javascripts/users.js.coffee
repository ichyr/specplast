# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

tokenInputInit = ->
  $(".token_input").each ->
    el = $(this)
    el.tokenInput el.data("url"),
      crossDomain: false
      theme: "facebook"
      prePopulate: el.data("pre")
      preventDuplicates: true

    return

  return

$(document).ready tokenInputInit
$(document).on "page:load", tokenInputInit