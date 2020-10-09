Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/about', to: 'static_pages#about'
  devise_for :users
  
  get '/gears', to: 'gears#index'
  get 'gears/new', to: 'gears#new'
  post 'gears/create'
  get 'gears/:id', to: 'gears#show'
  delete 'gears/:id/destroy', to: 'gears#destroy'
  
  get 'gears/:id/edit', to: 'gears#edit'
  patch 'gears/:id/update', to: 'gears#update'
  
  
end
