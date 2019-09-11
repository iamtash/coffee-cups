Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  get '/auth/github/callback' => 'sessions#create'
  resources :sessions, only: [:create]
  delete 'sessions/:id' => 'sessions#destroy', as: 'logout'
  
  resources :roasters do
    resources :coffees, except: :index
  end

  resources :coffees, only: :index

  resources :users, only: [:new, :create, :show] do
    resources :cups, only: [:show, :edit]
  end
  get 'signup' => 'users#new'

  resources :cups, only: [:new, :create, :update, :index, :destroy]

  root 'cups#index'

end