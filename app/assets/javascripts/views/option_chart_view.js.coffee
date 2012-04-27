class Optionplus.Views.OptionChartView extends Backbone.View
  className: 'row'
  template: JST['option_chart']

  initialize: ->
    @model.on('refreshOptionChart refreshForm', @render, @)

  render: ->
    @model.updateAllStrings()
    console.log('rendering option chart',@model)
    $(@el).html(@template({model: @model}))
    @
