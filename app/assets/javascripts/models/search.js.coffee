class Optionplus.Models.Search extends Backbone.Model 
  urlRoot: '/stocks'

  defaults:
    'id': 'SPY'
    'industry':{name: 'undefined'}
    'period': '2d'
    'option_type': 'C'
    'expirations': {}


  initialize: ->
    #@on('change:id', @getData)
    #@on('change:strike change:expiration change:period', @updateOptionString)
    #@on('change:period', @updateAllStrings)


  updateAllStrings: ->
    @updateExpiration()
    @updateStrike()
    @set('stock_chart_url', "/stock_chart/#{@get('id')}/#{@get('period')}")
    @set('option_chart_url', "option_chart/#{@get('id')}/#{@get('option_type')}/#{@get('period')}/#{@get('strike').val()}/#{@get('expiration').val()}")

  updateOptionString: ->
    @updateExpiration()
    @updateStrike()
    @set('stock_chart_url', "/stock_chart/#{@get('id')}/#{@get('period')}")
    @set('option_chart_url', "option_chart/#{@get('id')}/#{@get('option_type')}/#{@get('period')}/#{@get('strike').val()}/#{@get('expiration').val()}")


  _stock_chart_url: ->
    "/stock_chart/#{@symbol}/#{@period}"

  _option_chart_url: ->
    "option_chart/#{@symbol}/#{@period}/#{@strike}/#{@expiration}"

  updatePeriod: ->
    @set('period', $('input[name="period"]:checked').val())

  updateExpiration: ->
    
    @set('expiration', $('select[name="expiration"] option:selected'))

  updateStrike: ->
    @set('strike', $('select[name="strike"] option:selected'))

  updateOptionType: ->
    @set('option_type', $('input[name="option_type"]:checked').val())
