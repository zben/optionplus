Optionplus::Application.routes.draw do 
  
  match "stocks/:symbol"=>"stocks#show"

  get "pages/homepage"

  get 'get_image/:ticker'=>"api/Data#get_image"
  get 'get_price/:ticker'=>"api/Data#get_price"
  root to: 'pages#home'
end

