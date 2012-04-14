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
    $.get "/get_price/"+ticker,(data) ->
      $("#price").text(data['quote'])
      $("img#chart").attr("src", "data:image/png;base64,"+data['image'])
      
