decorate_vmilists = ->
  $(".decorate-array").each ->
    el = $(this)
    text = el.text()
    
    # delete [ and ] synbols
    text = text.slice(1, -1)
    
    # delete all double qoutes
    text = text.replace("\"", "")  while text.indexOf("\"") >= 0
    
    # split into array of names
    tags = text.split(", ")
    result = ""
    
    # enclose every tag into span
    tags.forEach (a) ->
      result += "<span class='btn btn-xs btn-default'>"
      result += a
      result += "</span>\n"
      return

    
    # replace original mess with decorated
    el.html result
    return

  return
$(document).on "ready page:update", decorate_vmilists