class Optionplus.Views.OptionsIndex extends Backbone.View

  template: JST['options/index']

  initialize: ->

  events:
    'keyup #ticker': 'getQuote'

  render: ->
    $(@el).html(@template)
    this

  getQuote: (event) =>
    event.preventDefault()
    ticker = $('#ticker').val()
    if ticker.length!=0 
      $.get "/get_price/"+ticker,(data) ->
        $("img#chart").attr("src", "get_image/"+ticker)
        $("#price").text(data)
    
