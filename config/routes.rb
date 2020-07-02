Rails.application.routes.draw do
  root 'static_pages#home'
  get 'current_weather' => 'static_pages#current'
  get 'forecast' => 'static_pages#forecast'
end
