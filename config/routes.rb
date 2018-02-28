Rails.application.routes.draw do
  root :to => "weather#index", as: :weather
  post "/weather/get_weather" => "weather#get_weather"
  get "/weather/details" => "weather#details"
end
