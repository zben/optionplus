class Optionplus.Models.Search extends Backbone.Model 
  urlRoot: '/stocks' 

  initialize: ->
    @on('change:ticker',@getData)
    @on('change:strike change:expiration change:period', @updateOptionString)
    @on('change:period', @updateAllStrings)

  getData: ->
    @fetch()

  updateAllStrings: ->
    console.log(@)
    @set('stock_chart_string',stock_chart_url)
    @set('option_chart_url',option_chart_url)

  updateOptionString: ->
    @set('stock_chart_string',stock_chart_url())

  stock_chart_url: ->
    "/stock_chart/#{@symbol}/#{period}"
  
  option_chart_url: ->
    "option_chart/#{@symbol}/#{period}/#{strike}/#{expiration}"

  period: ->
    @model.set('period', $('input[name="period"]').val()).get('period')

  expiration: ->
    @model.set('expiration', $('input[name="expiration"]').val()).get('expiration')

  strike: ->
    @model.set('strike', $('input[name="strike"]').val()).get('strike')
