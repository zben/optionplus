class Optionplus.Views.LayoutView extends Backbone.View
  template: JST['layout']

  initialize: ->
    @expirations = @options.expirations
    @model.on('initializeViews', @renderSubViews, @)

  renderSubViews: =>
    @_renderSearchForm()
    @_renderStockChart()
    @_renderOptionChart()


  render: ->
    $(@el).html(@template)
    @
  _renderSearchForm: ->
    search_form = new Optionplus.Views.SearchFormView({model: @model, expirations: @expirations})
    @.$('#search_form').html(search_form.render().el)

  _renderStockChart: ->
    stock_chart = new Optionplus.Views.StockChartView({model: @model})
    @.$('#stock_chart').html(stock_chart.render().el)

  _renderOptionChart: ->
    option_chart = new Optionplus.Views.OptionChartView({model: @model, expirations: @expirations})
    @.$('#option_chart').html(option_chart.render().el)
