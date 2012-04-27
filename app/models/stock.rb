class Stock
  include Mongoid::Document
  
  field :symbol
  field :company_name
  belongs_to :industry
  has_many :bookmarks, as: :bookmarkable
  field :strike_prices, type: Array
 
  def price
    google_data.last
  end

  def change
    google_data.change
  end

  def perc_change
    google_data.perc_change
  end


  def strike_prices
    prices = (-10..10).map{ |distance| default_strike_price + distance * interval }
    prices.map{|price| [strike_form_value(price), displayed_string(price)]}
  end

  def default_strike_price
    price.divmod(interval)[0]*interval
  end

  def default_strike_price_string
    strike_form_value(default_strike_price)
  end

  def self.expirations
    expirations={}
    expirations[Chronic.parse("last week Friday")] = "weekly"
    expirations[Chronic.parse("this week Friday")] = "weekly"
    expirations[Chronic.parse("next week Friday")] = "weekly"
    last_month= Chronic.parse("3rd Friday last month")
    5.times do
      last_month = Chronic.parse("3rd Friday next month",now: last_month)
      expirations[last_month] = "monthly"
    end
    expirations.map do |date, type|
      Expiration.new(date, type)
    end
  end

  private

  def interval
    interval ||= case price
      when 0..5 then    0.5
      when 5..10 then   2.5
      when 10..100 then 1
      else          5
    end
    interval
  end

  def google_data
    @data ||= StockQuote::Stock.quote(symbol)
  end

  def strike_form_value strike
    (strike*1000).to_i.to_s.rjust(8,"0")
  end

  def displayed_string strike
     "$#{strike.to_s.ljust(14," ")} ( #{"%5.1f%" % (strike*100/price-100)} ) "
  end
end


