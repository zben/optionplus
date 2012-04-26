class Optionplus.Routers.OptionplusRoute extends Backbone.Router
  routes:
    '': 'index'
    ':symbol':'show'

  initialize: ->
    @search = new Optionplus.Models.Search
    form_view = new Optionplus.Views.SearchFormView({model: @search})
    $("#search_form").html(form_view.render().el)

    stockChartView = new Optionplus.Views.StockChartView({model: @search})
    $("#stock_chart").html(stockChartView.render().el)

    optionChartView = new Optionplus.Views.OptionChartView({model: @search})
    $("#option_chart").html(optionChartView.render().el)

    watchlistCollectionView = new Optionplus.Views.WatchlistCollectionView
    $("#watchlist").html(watchlistCollectionView.render().el)

  index: ->
    @search.set('id','SPY')
    @search.fetch();

  show: (symbol) =>
    @search.set('id',symbol)
    @search.fetch();


