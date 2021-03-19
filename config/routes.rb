Rails.application.routes.draw do
  # Static pages routes
  match '/home', to: 'static_pages#home', via: [:get]
  match '/help', to: 'static_pages#help', via: [:get]
  match '/about', to: 'static_pages#about', via: [:get]
  match '/contact', to: 'static_pages#contact', via: [:get]
  match '/signIn', to: 'static_pages#signIn', via: [:get]

  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/signIn'

  # Users/signup routes
  get 'users/new'
  match '/signup', to: 'users#new', via: [:get]

  # Root
  root "static_pages#home" 

  resources :chats
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
