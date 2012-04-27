class Optionplus.Views.StockChartView extends Backbone.View
  className: 'row'
  initialize: ->
    @model.on('refreshForm', @render, @)
    @model.on('refreshStockChart', @render, @)
  render: ->
    console.log('rendering stock chart',@model)
    @model.updateAllStrings()
    industry_name = if @model.get('industry') then @model.get('industry').name else "---"
    $(@el).html(JST['stock_chart']({model: @model, industry: industry_name}))
    @
