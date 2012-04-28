class Expiration
  def initialize(date, type)
    @date = date
    @type = type
  end

  def as_json(options = nil)
    {
      url_fragment: url_fragment,
      display: @date.strftime("%b %d, %Y"),
      days_left: trading_days_left
    }
  end

  private

  def url_fragment
    if @type == "weekly"
      @date.strftime("%y%m%d")
    else
      (@date + 1.day).strftime("%y%m%d")
    end
  end

  def trading_days_left
    raw_days = @date.to_date - Date.today
    days = (raw_days*5/7).floor + 1
    if days > 0 
      "#{days} trading days until expiration" 
    else
      "#{-days} trading days past expiration"
    end
  end

end
