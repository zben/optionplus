class Optionplus.Views.SearchFormView extends Backbone.View
  template: JST['search_form']

  initialize: ->
    @expirations = @options.expirations
    @model.on('refreshForm', @render, @)
  events:
    'blur input[name="id"]': 'updateSearchById'
    'change .config input':'updateSearch'
    'change .config select':'updateSearch'

  render: ->
    strike_prices = @model.get('strike_prices')
    $(@el).html(@template({model: @model, strike_prices: strike_prices, expirations: @expirations }))
    $(@el).find('select[name="expiration"] option:nth-child(2)').attr('selected','selected')
    @


  updateSearch: (input) =>
    @model.set(input.target.name, input.target.value)
    @model.trigger('refreshOptionChart')
    if input.target.name == "period"
      @model.trigger('refreshStockChart')

  updateSearchById: (input) =>
    ticker_input = input.target.value
    ticker = if ticker_input=="" then "SPY" else ticker_input.toUpperCase()
    @model.set('id', ticker)
    @model.fetch
      success: (model, response) =>
        @model.trigger('refreshForm')

