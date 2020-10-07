Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/about', to: 'static_pages#about'
  devise_for :users
  get '/gears',to: 'gears#index'
  get 'gears/new', to: 'gears#new'
  post 'gears/create'
  
end
