Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/signIn'

  root "chats#index" 

  resources :chats
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
