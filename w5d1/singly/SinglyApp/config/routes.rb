Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :bands
  resources :albums
  resources :tracks
  resources :notes, except: [:new, :show, :index, :edit, :update]

  resource :sessions, only: [:new, :create, :destroy]

end # class
