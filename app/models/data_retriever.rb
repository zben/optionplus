class DataRetriever < ActiveRecord::Base
  def self.get_price ticker
    require 'csv'
    require 'open-uri'
    quote = CSV.new(open("http://finance.yahoo.com/d/quotes.csv?s=#{ticker.upcase}&f=kl")).first.first
    quote = "quote unavailable" if quote == "N/A"
    "$"+quote
  rescue
    "quote unavailable"
  end

  def self.get_image ticker
    url="http://app.quotemedia.com/quotetools/getChart?webmasterId=500&snap=true&symbol=#{ticker.upcase}&chscale=1d&chtype=AreaChart&chwid=477&chhig=495&chpccol=ff0000&chfrmon=false&chton=false&chpcon=true"
    ActiveSupport::Base64.encode64(open(url) { |io| io.read })
  end
end
