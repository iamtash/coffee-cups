Rails.application.routes.draw do
  get 'roasters/new'
  get 'roasters/index'
  get 'roasters/show'
  get 'users/new'
  get 'users/show'
  get 'cups/new'
  get 'cups/edit'
  get 'cups/show'
  get 'cups/index'
  get 'coffees/new'
  get 'coffees/edit'
  get 'coffees/show'
  get 'coffees/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
