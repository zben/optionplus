class StocksController < ApplicationController
  def show
    @stock = Stock.where(symbol: params[:symbol]).first
  end
end
