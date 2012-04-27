class Optionplus.Routers.OptionplusRoute extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    search = new Optionplus.Models.Search
    layout_view = new Optionplus.Views.LayoutView({model: search})
    $('#main').html(layout_view.render().el)
