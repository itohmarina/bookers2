Rails.application.routes.draw do

  root to: "homes#top"
  get 'home/about'=>'homes#about'

  devise_for :users,controllers: {registrations:'users/registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show,:edit,:update,:index]
  resources :books, only: [:index,:create,:show,:update,:edit,:destroy]

end
