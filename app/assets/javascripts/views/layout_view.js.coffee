class Optionplus.Views.LayoutView extends Backbone.View
  template: JST['layout']

  initialize: ->

  render: ->
    @model.fetch
      success: (model, response) =>
        @model.trigger('refreshForm')

    @_renderLayout()
    @_renderSearchForm()
    @_renderStockChart()
    @_renderOptionChart()
    @

  _renderLayout: ->
    $(@el).html(@template)

  _renderSearchForm: ->
    search_form = new Optionplus.Views.SearchFormView({model: @model})
    @.$('#search_form').html(search_form.render().el)

  _renderStockChart: ->
    stock_chart = new Optionplus.Views.StockChartView({model: @model})
    @.$('#stock_chart').html(stock_chart.render().el)

  _renderOptionChart: ->
    option_chart = new Optionplus.Views.OptionChartView({model: @model})
    @.$('#option_chart').html(option_chart.render().el)
