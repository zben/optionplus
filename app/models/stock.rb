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
    (-10..10).map{ |distance| default_strike_price + distance * interval }
  end

  def default_strike_price
    price.divmod(interval)[0]*interval
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
end


