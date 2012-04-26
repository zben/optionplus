class Optionplus.Routers.Optionplus extends Backbone.Router
  routes:
    '': 'index'
    ':symbol':'show'

  initialize: ->
    search = new Optionplus.Models.Search
    form_view = new Optionplus.Views.SearchFormView
    $("#search_form").html(form_view.render().el)

    stock_chart_view = new Optionplus.Views.StockChartView
    $("#stock_chart").html(stock_chart_view.render().el)

    option_chart_view = new Optionplus.Views.OptionChartView
    $("#option_chart").html(option_chart_view.render().el)


  index: ->
    search.set('id','SPY')
    search.fetch();

  show: (symbol) =>
    search.set('id',symbol)
    search.fetch();


