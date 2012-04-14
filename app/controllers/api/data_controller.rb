class Api::DataController < ApplicationController
  
  def get_price
    quote_string = DataRetriever.get_price(params[:ticker])
    image_data = DataRetriever.get_image(params[:ticker])
    render json: {:quote=>quote_string, :image=>image_data}
  end
end
