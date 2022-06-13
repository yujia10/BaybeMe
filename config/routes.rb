Rails.application.routes.draw do
  devise_for :users


  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :childcares, only: [:index, :show] do
    resources :applications, only: [:new, :create, :show, :destroy, :index]
  end

  resources :users, only: [:show]
  resources :children

end
