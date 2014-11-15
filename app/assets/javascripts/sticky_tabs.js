// make tabs reflect actual state in url
// code taken from

// push state change on tabs change
// http://stackoverflow.com/questions/12131273/twitter-bootstrap-tabs-url-doesnt-change

// turbolinks issue
// http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links

var ready;
ready = function(){
  var hash = window.location.hash;
  hash && $('ul.nav a[href="' + hash + '"]').tab('show');

  $('.nav-tabs a').click(function (e) {
    $(this).tab('show');
    var scrollmem = $('body').scrollTop();
    window.location.hash = this.hash;
    $('html,body').scrollTop(scrollmem);
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);