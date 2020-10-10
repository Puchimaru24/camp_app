Rails.application.routes.draw do

  get 'users/show'

  root 'static_pages#home'
  get  '/about', to: 'static_pages#about'
  
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
  }
  get 'users', to: 'users#index'
  get "users/show" => "users#show"

  
  get '/gears', to: 'gears#index'
  get 'gears/new', to: 'gears#new'
  post 'gears/create'
  get 'gears/:id', to: 'gears#show'
  delete 'gears/:id/destroy', to: 'gears#destroy'
  
  get 'gears/:id/edit', to: 'gears#edit'
  patch 'gears/:id/update', to: 'gears#update'
  
  
end
