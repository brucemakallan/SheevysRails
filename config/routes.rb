Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :bookings
  get 'home', to: 'pages#home'
  post 'home', to: 'pages#home' #post request for the button
  get 'gallery', to: 'pages#gallery'
  get 'rooms', to: 'pages#rooms'
  get 'location', to: 'pages#location'
  get 'availability', to: 'pages#availability'
  post 'availability', to: 'pages#availability' #post request for the button

  root to: 'pages#home' #set homepage
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
