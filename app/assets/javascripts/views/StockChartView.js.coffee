class Optionplus.Views.StockChartView extends Backbone.View
  template: JST['stock_chart']

  initialize: ->
    @on('updateStockChart', @render, @)

  render: ->
    $(@el).html(@template)
    this


