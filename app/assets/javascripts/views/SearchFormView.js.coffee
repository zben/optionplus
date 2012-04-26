class Optionplus.Views.SearchFormView extends Backbone.View

  template: JST['search_form']

  initialize: ->

  events:
    'change input#ticker': 'updateStockChart'
    'change input.option_config': 'updateOptionChart'
    'change input.chart_config': 'updateAllCharts'

  render: ->
    $(@el).html(@template)
    this

  getQuote: (event) =>
    event.preventDefault()
    ticker = $('#ticker').val()
    if ticker.length!=0 
      #.get "/get_price/"+ticker,(data) ->
        $("img#chart").attr("src", "get_image/"+ticker)
      #  $("#price").text(data)

  updateStockChart: ->
    stockChartView.trigger('updateStockChart')

  updateOptionChart: ->
    optionChartView.trigger('updateOptionChart')

  updateAllCharts: ->
    stockChartView.trigger('updateStockChart')
    optionChartView.trigger('updateOptionChart')



