class Optionplus.Routers.OptionplusRoute extends Backbone.Router
  routes:
    '': 'index'

  initialize: (options) ->
    @expirations = options.expirations

  index: ->
    search = new Optionplus.Models.Search
    expirations = new Optionplus.Collections.ExpirationCollection(@expirations)
    layout_view = new Optionplus.Views.LayoutView({model: search, expirations: expirations})
    $('#main').html(layout_view.render().el)
    search.fetch
      success: (model, response) ->
        search.trigger('initializeViews')
