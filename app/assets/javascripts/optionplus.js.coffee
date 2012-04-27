window.Optionplus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: (options) ->
    new Optionplus.Routers.OptionplusRoute(options)
    Backbone.history.start()
