Rails.application.routes.draw do
  get 'home', to: 'pages#home'

  get 'gallery', to: 'pages#gallery'

  root to: 'pages#home' #set homepage
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
