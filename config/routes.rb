Optionplus::Application.routes.draw do 
  
  match "stocks/(:symbol)"=>"stocks#show"

  get "pages/homepage"

  get 'stock_chart/:ticker/:period'=>"api/Data#get_stock_chart"
  get 'option_chart/:ticker/:option_type/:period/:strike/:expiration'=>"api/Data#get_option_chart"
  root to: 'pages#home'
end

