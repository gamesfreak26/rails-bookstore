Rails.application.routes.draw do
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new'
  get '/books/:id', to: 'books#show', as: 'book'
  post '/books/new', to: 'books#create', as: 'create_book'
end
