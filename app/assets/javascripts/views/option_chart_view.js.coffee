class Optionplus.Views.OptionChartView extends Backbone.View
  className: 'row'
  template: JST['option_chart']

  initialize: ->
    @model.on('refreshChart refreshForm', @render, @)

  render: ->
    @model.updateAllStrings()
    window.search = @model
    $(@el).html(@template({model: @model}))
    @
