//= require jquery3
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require popper
//= require bootstrap-sprockets

initApplicationPlugins = function () {};

$(function () {
  initApplicationPlugins();
});

document.addEventListener("turbolinks:load", function () {
  initApplicationPlugins();
});

var reloadWithTurbolinks = (function () {
  var scrollPosition

  function reload() {
    scrollPosition = [window.scrollX, window.scrollY]
    Turbolinks.visit(window.location.toString(), {
      action: 'replace'
    })
  }

  document.addEventListener('turbolinks:load', function () {
    if (scrollPosition) {
      window.scrollTo.apply(window, scrollPosition)
      scrollPosition = null
    }
  })

  return reload
})();