class Api::DataController < ApplicationController
  
 

  def get_stock_chart
    require 'open-uri'

    url="http://app.quotemedia.com/quotetools/getChart?" +
     "webmasterId=500&snap=true&symbol=#{params[:ticker].upcase}" +
     "&chscale=#{params[:period]}" +
     "&chtype=AreaChart" +
     "&chwid=677" +
     "&chhig=295" +
     "&chpccol=ff0000" +
     "&chfrmon=false" +
     "&chton=false" +
     "&chpcon=true"
    send_data open(url){|io| io.read}, :type=>"image/png", :disposition=>'inline' 
  end

  def get_option_chart
    require 'open-uri'

    url= "http://app.quotemedia.com/quotetools/getChart?" +
     "webmasterId=500&snap=true&symbol=@#{params[:ticker].upcase}" +
     "%20"*(6-params[:ticker].size) +
     "#{params[:expiration]}" +
     "#{params[:option_type]}" +
     "#{params[:strike]}" +
     "&chscale=#{params[:period]}" +
     "&chtype=AreaChart" +
     "&locale=en_US" +
     "&chwid=677" +
     "&chhig=295" +
     "&chpccol=ff0000" +
     "&chfrmon=false" +
     "&chton=false" +
     "&chpcon=true"
    logger.info url
    send_data open(url){|io| io.read}, :type=>"image/png", :disposition=>'inline' 
  end


end
