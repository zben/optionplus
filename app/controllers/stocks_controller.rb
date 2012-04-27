class StocksController < ApplicationController
  def show
    @stock = Stock.find_or_initialize_by(symbol: params[:symbol].upcase)
  end
end
