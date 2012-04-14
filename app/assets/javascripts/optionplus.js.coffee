window.Optionplus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Optionplus.Routers.Options()
    Backbone.history.start()

$(document).ready ->
  Optionplus.init()
