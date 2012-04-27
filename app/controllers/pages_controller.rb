class PagesController < ApplicationController
  def home
    @expirations = Stock.expirations
  end
end
