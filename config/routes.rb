Rails.application.routes.draw do
  root "chats#index" 

  resources :chats
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
