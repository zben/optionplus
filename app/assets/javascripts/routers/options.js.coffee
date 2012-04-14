class Optionplus.Routers.Options extends Backbone.Router
  routes:
    '': 'index'
  initialize: ->
  index: ->
    view = new Optionplus.Views.OptionsIndex()
    $("#container").html(view.render().el)
