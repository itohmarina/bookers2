Rails.application.routes.draw do

  root to: "homes#top"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show,:edit,:update,:index]
  resources :books, only: [:index,:new,:create,:show,:update,:edit,:destroy]

end
