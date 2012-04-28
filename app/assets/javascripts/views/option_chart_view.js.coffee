class Optionplus.Views.OptionChartView extends Backbone.View
  className: 'row'
  template: JST['option_chart']

  initialize: (options)->
    @expirations = options.expirations
    @model.on('refreshOptionChart refreshForm', @render, @)

  render: ->
    @model.updateAllStrings()
    console.log('rendering option chart',@model)
    expiration = @expirations.where(url_fragment: @model.get('expiration').val())
    expiration = expiration[0]
    $(@el).html(@template({model: @model, expiration: expiration}))
    @
