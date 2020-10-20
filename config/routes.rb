Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/about', to: 'static_pages#about'
  
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
  }
  get 'users', to: 'users#index'
  get "users/:id" => "users#show"

  
  get '/gears', to: 'gears#index'
  get 'gears/new', to: 'gears#new'
  get 'gears/:id', to: 'gears#show'
  post 'gears/create'
  get 'gears/:id/edit', to: 'gears#edit'
  patch 'gears/:id/update', to: 'gears#update'
  delete 'gears/:id/destroy', to: 'gears#destroy'
  
  get '/posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show'
  post 'posts/create'
  get 'posts/:id/edit', to: 'posts#edit'
  post 'posts/:id/update', to: 'posts#update'
  delete 'posts/:id/destroy', to: 'posts#destroy'
  
  get '/search', to: 'search#search'
  
end
