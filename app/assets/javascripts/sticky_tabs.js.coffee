# make tabs reflect actual state in url
# code taken from

# push state change on tabs change
# http://stackoverflow.com/questions/12131273/twitter-bootstrap-tabs-url-doesnt-change

# turbolinks issue
# http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links

sticky_tabs_activate = ->
  hash = window.location.hash
  hash and $("ul.nav a[href=\"" + hash + "\"]").tab("show")
  $(".nav-tabs a").click (e) ->
    unless $(this).attr("data-spec") is "true"
      $(this).tab "show"
      scrollmem = $("body").scrollTop()
      window.location.hash = @hash
      $("html,body").scrollTop scrollmem
    else
      $(this).tab "show"
      window.location.hash = @hash
    return

  return

$(document).on "ready page:update", sticky_tabs_activate