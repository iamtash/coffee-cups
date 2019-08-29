Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  resources :sessions, only: [:create]
  delete 'sessions/:id' => 'sessions#destroy', as: 'logout'
  
  resources :roasters do
    resources :coffees
  end

  resources :users, only: [:new, :create, :show] do
    resources :cups, only: [:new, :create, :edit, :show]
  end

  get 'cups/index' => 'cups#index'
  root 'cups#index'

end
