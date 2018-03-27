Rails.application.routes.draw do
  resources :bookings
  get 'home', to: 'pages#home'
  get 'gallery', to: 'pages#gallery'
  post 'home', to: 'pages#home' #post request for the button
  get 'rooms', to: 'pages#rooms'
  get 'location', to: 'pages#location'

  root to: 'pages#home' #set homepage
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
