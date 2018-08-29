Rails.application.routes.draw do

devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:show,:index,:edit,:create,:update]
resources :books, only: [:show,:index,:edit,:create,:destroy,:update]

root 'books#top'

get "/about" => "books#about"
end
