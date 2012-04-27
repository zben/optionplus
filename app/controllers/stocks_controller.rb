class StocksController < ApplicationController
  respond_to :json
  def show
    @stock = Stock.find_or_initialize_by(symbol: params[:symbol].upcase)
  end

  def expirations
    respond_with(Stock.expirations)
  end
end
