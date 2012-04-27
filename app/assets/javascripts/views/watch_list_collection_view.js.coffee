class Optionplus.Views.WatchlistCollectionView extends Backbone.View
  template: JST['watchlist']

  initialize: ->
    @on('updateWatchlist', @render, @)

  render: ->
    $(@el).html(@template)
    this

