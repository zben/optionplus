Optionplus::Application.routes.draw do 
  get "pages/homepage"

  get 'get_price/:ticker'=>"api/Data#get_price"
  root to: 'pages#home'
end

