class Optionplus.Views.SearchFormView extends Backbone.View

  template: JST['search_form']

  initialize: ->

  events:
    'keyup input[name="ticker"]': 'updateSearch'
    'change .config input':'updateSearch'
  
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

  updateSearch: (input) =>
    console.log(input.target.name)
    console.log(input.target.value)
    @model.set(input.target.name,input.target.value)
    console.log(@model)

