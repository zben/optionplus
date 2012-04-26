class Optionplus.Views.StockChartView extends Backbone.View
  template: JST['stock_chart']

  initialize: ->
    @on('updateStockChart', @render, @)
    @model.on('change',@render,@)
  render: ->
    $(@el).html(@template)
    this


