Rails.application.routes.draw do
  post 'payments/webhook'
  get 'payments/success'
  # get 'order_items/create'
  # get 'order_items/update'
  # get 'order_items/destroy'
  resources :order_items
  get 'cart', to: 'cart#show'
  devise_for :users
  resources :authors
  resources :books
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/books', to: 'books#index'
  # get '/books/new', to: 'books#new', as: 'new_book'
  # get '/books/:id', to: 'books#show', as: 'book'
  # get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  # post '/books/new', to: 'books#create', as: 'create_book'
  # patch '/books/:id', to: 'books#update', as: 'update_book'
end
