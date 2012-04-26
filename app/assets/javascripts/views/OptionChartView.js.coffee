class Optionplus.Views.OptionChartView extends Backbone.View
  template: JST['option_chart']

  initialize: ->
    @on('updateOptionCharts', @render, @)

  render: ->
    $(@el).html(@template)
    this
