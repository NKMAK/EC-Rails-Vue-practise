Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    post "signup" => "auth#signup"
    post "login" => "auth#login"
    post "refresh-token" => "auth#refresh_token"

    post "productRegist" => "product#create" 
    get "productList" => "product#get"
    get "productOneGet" => "product#one_get"

    post "addCart" => "cart#add"
    get "getCart" => "cart#get"

    delete "deleteCartItem" => "cart#delete"
    post "purchase" => "cart#purchase"
  end
end