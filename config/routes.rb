Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  resources :sessions, only: [:create]
  delete 'sessions/:id' => 'sessions#destroy', as: 'logout'
  
  resources :roasters do
    resources :coffees
  end

  resources :users, only: [:new, :create, :show]
  get 'signup' => 'users#new'

  resources :cups

  root 'cups#index'

end
