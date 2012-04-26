window.Optionplus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Optionplus.Routers.OptionplusRoute
    Backbone.history.start()

$(document).ready -> 
  Optionplus.init()
