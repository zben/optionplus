class Api::DataController < ApplicationController
  
  def get_price
    quote_string = DataRetriever.get_price(params[:ticker])
    render text: quote_string
  end

  def get_image
    require 'open-uri'
    ticker = params[:ticker]
    url="http://app.quotemedia.com/quotetools/getChart?webmasterId=500&snap=true&symbol=#{ticker.upcase}&chscale=1d&chtype=AreaChart&chwid=277&chhig=295&chpccol=ff0000&chfrmon=false&chton=false&chpcon=true"

    send_data open(url){|io| io.read}, :type=>"image/png", :disposition=>'inline' 
  end
end
