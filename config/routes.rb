Rails.application.routes.draw do

  root 'movies#index'
  devise_for :users
  resources :directors
  resources :actors
  resources :professionals
  get 'movies' => "movies#index"
  get 'movies/new' => "movies#new"
  get 'movies/:id' => "movies#show"
  post 'movies' => "movies#create"
  get 'movies/:id/edit' => "movies#edit"
  put 'movies/:id/' => "movies#update"
  post 'movies/:id/classifications' => "movies#create_classification"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
