Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  resources :sessions, only: [:create]
  delete 'sessions/:id' => 'sessions#destroy', as: 'logout'
  
  resources :roasters do
    resources :coffees
  end

  resources :users, only: [:new, :create, :show] do
    resources :cups, only: [:show, :edit]
  end
  get 'signup' => 'users#new'

  resources :cups, only: [:new, :create, :update, :index, :destroy]

  root 'cups#index'

end
