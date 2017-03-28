$(document).on "page:update",  (event) ->
  if typeof ga is "function"
    console.log('triggered')
    ga("set", "location", location.pathname)
    ga("send", "pageview")